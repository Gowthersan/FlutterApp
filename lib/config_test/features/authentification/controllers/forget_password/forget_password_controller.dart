import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/data/repositories/authentification/authentication_repository.dart';
import 'package:mombien_test/config_test/utils/helpers/network_manager.dart';
import 'package:mombien_test/config_test/utils/popups/full_screen_loader.dart';
import 'package:mombien_test/config_test/utils/popups/loaders.dart';
import 'package:mombien_test/core.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Varaibles
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Envoyer un email de reinitialisation de mot de passe
  sendPasswordResetEmail() async {
    try {
      //Commencer le chargement
      TFullScreenLoader.openLoadingDialog(
          'Envoi de l\'email...', TImages.docerAnimation);

      //Vérifier la connexion internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Erreur', message: 'Pas de connexion internet');
        return;
      }

      //Validation du formulaire
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Envoyer un mail pour réinitialiser le mot de passe
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Supprimer le chargement
      TFullScreenLoader.stopLoading();

      // Montrer la confirmation
      TLoaders.successSnackBar(
          title: 'Email envoyé',
          message:
              'Un email de reinitialisation de mot de passe a ete envoyé'.tr);

      //Rediriger
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Erreur !', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //Commencer le chargement
      TFullScreenLoader.openLoadingDialog(
          'Envoi de l\'email...', TImages.docerAnimation);

      //Vérifier la connexion internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Erreur', message: 'Pas de connexion internet');
        return;
      }

      // Envoyer un mail pour réinitialiser le mot de passe
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Supprimer le chargement
      TFullScreenLoader.stopLoading();

      // Montrer la confirmation
      TLoaders.successSnackBar(
          title: 'Email envoyé',
          message:
              'Un email de reinitialisation de mot de passe a ete envoyé'.tr);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Erreur !', message: e.toString());
    }
  }
}
