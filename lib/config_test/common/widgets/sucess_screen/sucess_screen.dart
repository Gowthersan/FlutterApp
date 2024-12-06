import 'package:flutter/material.dart';

import 'package:mombien_test/config_test/common/styles/spacing_styles.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/constants/text_strings.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: THelperFunctions.screenWidth() *
                      0.4, // Limiter à 60% de la largeur de l'écran
                ),
                child: Image(
                  image: AssetImage(image),
                  width: double
                      .infinity, // Prendre la largeur du parent (limité par ConstrainedBox)
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Titre & Sous titres
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: THelperFunctions.screenWidth() *
                      0.8, // Limiter à 80% de la largeur de l'écran
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Bouton
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
