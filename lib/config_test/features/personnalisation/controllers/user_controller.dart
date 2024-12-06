import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mombien_test/config_test/data/repositories/authentification/authentication_repository.dart';
import 'package:mombien_test/config_test/data/repositories/user/user_repository.dart';
import 'package:mombien_test/config_test/features/authentification/screens/login/login.dart';
import 'package:mombien_test/config_test/features/personnalisation/models/user/user_model.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:mombien_test/config_test/utils/constants/image_strings.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/helpers/network_manager.dart';
import 'package:mombien_test/config_test/utils/popups/full_screen_loader.dart';
import 'package:mombien_test/config_test/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  final userRepository = Get.put(UserRepository());
  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  //Récupérer les données des utilisateurs
  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      //Lire les données de l'utilisateur
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Sauvegarder les données de l'utilisateur
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //Réactualiser les données de l'utilisateur si il est nouveau ou pas si il existe déjà créé de nouvelles données
      await fetchUserDetails();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //Convertir le nom en Nom et Prénom
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          //Lire les données de l'utilisateur
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Sauvegarder les données
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Données non sauvegardees',
        message:
            "Il y a eu un soucis, on n'a pas pu sauvegarder vos informations. Vous pouvez récessayer via votre profil.",
      );
    }
  }

  // Alerte de suppression de compte
  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Suppression de compte',
        middleText: 'Etes-vous sur de vouloir supprimer votre compte ?',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text("Supprimer mon compte"),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text("Annuler")));
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Suppression du compte...', TImages.docerAnimation);

      // Premier reAuth
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        //Re vérifier l'Email d'authentification
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Erreur', message: e.toString());
    }
  }

  //Re authentifier email et mot de passe avant de supprimer le compte
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Connexion...', TImages.docerAnimation);

      //Vérifier la connexion internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Fermer le chargement
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Erreur', message: 'Pas de connexion internet');
        return;
      }

      if (reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh non !', message: e.toString());
    }
  }

  //Mettre à jour l'image de profil

  // Future<String> convertImageToBase64(Uint8List imageBytes) async {
  //   return base64Encode(imageBytes);
  // }

  uploadUserProfilePicture() async {
    try {
      // if (!kIsWeb) {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
          title: 'Féliciations ! ',
          message: 'Votre photo de profil a été mise à jour.',
        );
      }
      // } else {
      //   final image = await await ImagePickerWeb.getImageAsBytes();

      //   if (image != null) {
      //     final base64String = await convertImageToBase64(image);
      //     Map<String, dynamic> json = {'ProfilePicture': base64String};
      //     await userRepository.updateSingleField(json);
      //     user.value.profilePicture = base64String;
      //     TLoaders.successSnackBar(
      //       title: 'Féliciations ! ',
      //       message: 'Votre photo de profil a been mise à jour.',
      //     );
      //   }
      // }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Erreur', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
