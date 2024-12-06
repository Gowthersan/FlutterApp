import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/features/personnalisation/controllers/update_name_controller.dart';
import 'package:mombien_test/core.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Changer votre nom',
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Utiliser un vrai nom pour vous identifier. Ce nom vous représentera dans tous les services de Mombien.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // TextField et Bouton
            Form(
                key: controller.updateUserNameFromKey,
                child: Column(
                  children: [
                    // TextField
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => TValidator.validateEmptyText(
                        'Prénom',
                        value,
                      ),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateEmptyText(
                        'Nom',
                        value,
                      ),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                )),
            const SizedBox(height: TSizes.spaceBtwSections),

            //Save Bouton
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Sauvegarder'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
