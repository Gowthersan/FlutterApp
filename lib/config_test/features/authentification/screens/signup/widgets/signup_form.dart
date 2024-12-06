import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/features/authentification/controllers/signup/signup_controller.dart';
import 'package:mombien_test/config_test/features/authentification/screens/signup/widgets/term_condition_checkbox.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/constants/text_strings.dart';
import 'package:mombien_test/config_test/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey, // Clé du formulaire
      child: Column(
        children: [
          ///Nom & Prénom
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.lastName,
                  ),
                ),
              ),
              // TextFormField(),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Nom d'utilisateur
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                TValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.emoji_happy),
              labelText: TTexts.username,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Numéro de téléphone
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: TTexts.phoneNo,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Mot de passe et Confirmation du mot de passe
          ///Mot de passe
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => TextFormField(
                    validator: (value) => TValidator.validatePassword(value),
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    expands: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)),
                      labelText: TTexts.password,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Confirmation du mot de passe
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => TextFormField(
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    validator: (value) => TValidator.validatePassword(value),
                    expands: false,
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)),
                      labelText: TTexts.confirmPassword,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Condition d'utilisation
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections - 5),

          ///Creer un compte
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
