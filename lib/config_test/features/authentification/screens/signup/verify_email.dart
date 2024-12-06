import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/data/repositories/authentification/authentication_repository.dart';
import 'package:mombien_test/config_test/features/authentification/controllers/signup/verify_email_controller.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/image_strings.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/constants/text_strings.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';
// import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      0.8, // Limiter à 80% de la largeur de l'écran
                ),
                child: const Image(
                  image: AssetImage(TImages.deliveredEmailIllustration),
                  width: double
                      .infinity, // Prendre la largeur du parent (limité par ConstrainedBox)
                  fit: BoxFit
                      .cover, // Ajuste l'image pour couvrir le conteneur tout en respectant les proportions
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Titre & Sous titres
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      0.9, // Limiter à 90% de la largeur de l'écran
                ),
                child: Column(
                  children: [
                    Text(
                      TTexts.confirmEmail,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      email ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      TTexts.confirmEmailSubTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Boutons
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      0.9, // Limiter à 90% de la largeur de l'écran
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller
                            .checkEmailVerificationStatus(), //Vérifier l'envoi de l'email
                        child: const Text(TTexts.tContinue),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => controller.sendEmailVerification(),
                        child: const Text(TTexts.resendEmail),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
