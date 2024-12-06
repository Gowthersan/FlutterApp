import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:mombien_test/config_test/common/styles/spacing_styles.dart';
// import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/core.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).brightness == Brightness.dark
          ? TColors.black
          : TColors.white,
      systemNavigationBarColor: Theme.of(context).brightness == Brightness.dark
          ? TColors.black
          : TColors.white,
    ));
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //Titre et sous-titre et Logo
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 600.0), // Limiter la largeur
                  child: const TLoginHeader(),
                ),
                const SizedBox(height: 16.0),

                //Forme Login
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 600.0), // Limiter la largeur
                  child: const TLoginForm(),
                ),
                const SizedBox(height: 16.0),
                TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                const SizedBox(height: 16.0),

                //Réseaux sociaux
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 600.0), // Limiter la largeur
                  child: const TSocialButtons(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
