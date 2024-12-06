import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/data/repositories/authentification/authentication_repository.dart';
import 'package:mombien_test/config_test/data/repositories/user/user_repository.dart';
import 'package:mombien_test/config_test/features/personnalisation/models/user/user_model.dart';
import 'package:mombien_test/config_test/utils/helpers/network_manager.dart';
import 'package:mombien_test/config_test/utils/popups/full_screen_loader.dart';
import 'package:mombien_test/config_test/utils/popups/loaders.dart';
import 'package:mombien_test/core.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final hidePassword = true.obs; //Cacher le mot de passe
  final privacyPolicy = true.obs; //Cocher la politique de confidentialité
  final email = TextEditingController(); //Controller de l'email
  final password = TextEditingController(); //Controller du mot de passe
  final lastName = TextEditingController(); //Controller du nom
  final firstName = TextEditingController(); //Controller du prenom
  final userName = TextEditingController(); //Controller du nom d'utilisateur
  final phoneNumber =
      TextEditingController(); //Controller du numero de telephone

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //Clé pour la validation du formulaire

  //Fonctions
  void signup() async {
    try {
      //Commencer le chargement
      TFullScreenLoader.openLoadingDialog(
          'Nous enregistrons vos informations...', TImages.docerAnimation);

      //Vérifier la connexion internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Fermer le chargement
        TFullScreenLoader.stopLoading();
        return;
      }

      //Validation qui verifie le formulaire et si les valeurs sont bien correctes si non ils retourne des erreurs
      if (!signupFormKey.currentState!.validate()) {
        //Fermer le chargement
        TFullScreenLoader.stopLoading();
        return;
      }

      //Vérification de la police de confidentialité / Si l'utilisateur ne sélectionne pas la case un avertissement s'affichera
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'ATTENTION !',
            message: 'Veuillez accepter la politique de confidentialité');
        TFullScreenLoader.stopLoading();
        return;
      }

      //Enregistrement de nouvel utilisateur dans Firebase et sauvegarde des données
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Enregistrement de l'authentification de l'utilisateur dans Firestore et sauvegarde des données
      final newUser = UserModel(
          id: userCredential.user!.uid,
          profilePicture: '',
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          phoneNumber: phoneNumber.text.trim());

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Fermer le chargement
      TFullScreenLoader.stopLoading();

      //Message de confirmation qu'on a bien enregistre le compte
      TLoaders.successSnackBar(
          title: 'Bravo !',
          message: 'Veuillez consulter votre courrier pour le valider.');

      //Aller vers la page de vérification de mail
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Message d'erreur
      TLoaders.errorSnackBar(title: 'Oh Désolé !', message: e.toString());
    }
  }
}
