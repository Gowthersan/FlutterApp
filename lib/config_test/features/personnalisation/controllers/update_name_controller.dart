import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/data/repositories/user/user_repository.dart';
import 'package:mombien_test/config_test/features/personnalisation/controllers/user_controller.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/profile/profile.dart';
import 'package:mombien_test/config_test/utils/helpers/network_manager.dart';
import 'package:mombien_test/config_test/utils/popups/full_screen_loader.dart';
import 'package:mombien_test/config_test/utils/popups/loaders.dart';
import 'package:mombien_test/core.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFromKey = GlobalKey<FormState>();

  //Init
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //Récupérer les utilisateurs
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //Chargement
      TFullScreenLoader.openLoadingDialog(
          'Nous actualisons vos informations...', TImages.docerAnimation);

      //Vérifier la connexion internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Fermer le chargement
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Erreur', message: 'Pas de connexion internet');
        return;
      }

      //Validation du formulaire
      if (!updateUserNameFromKey.currentState!.validate()) {
        //Fermer le chargement
        TFullScreenLoader.stopLoading();
        return;
      }

      //Actualiser le nom et le prénom de l'utilisateur
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // Mettre à jour le Rx utilisateur
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //Fermer le chargement
      TFullScreenLoader.stopLoading();

      //Message de succès
      TLoaders.successSnackBar(
        title: 'Félicitations',
        message: 'Nom et prénom actualisés avec succès',
      );

      //Redirection vers l'accueil
      Get.off(() => const ProfileScreen());
    } catch (e) {
      //Fermer le chargement
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: 'Erreur', message: 'Une erreur est survenue');
      print('Error: $e');
    }
  }
}
