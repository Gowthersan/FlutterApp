// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mombien_test/config_test/data/repositories/authentification/authentication_repository.dart';
import 'package:mombien_test/config_test/features/personnalisation/controllers/user_controller.dart';
import 'package:mombien_test/config_test/utils/helpers/network_manager.dart';
import 'package:mombien_test/config_test/utils/popups/full_screen_loader.dart';
import 'package:mombien_test/config_test/utils/popups/loaders.dart';
import 'package:mombien_test/core.dart';

class LoginController extends GetxController {
  //Variables
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final remberMe = false.obs;
  final hidePassword = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// -- Email & Password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Connexion...', TImages.docerAnimation);

      // Vérifier la connexion Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        print('================ NO CONNECTION ================');
        return;
      }

      // -- Validation du formulaire
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // -- Mémoriser les données si la case est cochée
      if (remberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // -- Tentative de connexion
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Use the userCredentials
      await userController.saveUserRecord(userCredentials);

      // Stoper le chargement
      TFullScreenLoader.stopLoading();

      // Redirection
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Désolé', message: e.toString());
    }
  }

  /// -- Google Sign In
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Connexion...', TImages.docerAnimation);

      // Vérifier la connexion Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        print('================ NO CONNECTION ================');
        return;
      }

      //Google Authentification
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //Sauvergarder les données de l'utilisateur
      await userController.saveUserRecord(userCredentials);

      // Stoper le chargement
      TFullScreenLoader.stopLoading();

      // Redirection
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //Supprimer le chargement
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Désolé', message: e.toString());
    }
  }
}
