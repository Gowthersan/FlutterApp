// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:mombien_test/config_test/features/personnalisation/controllers/property_controller.dart';
// import 'package:mombien_test/config_test/utils/validators/validation.dart';
// import 'package:mombien_test/core.dart';

// class TPropertiesForm extends StatelessWidget {
//   const TPropertiesForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(PropertiesController());

//     return Form(
//       key: controller.propertiesFormKey, // Clé du formulaire
//       child: Column(
//         children: [
//           // Titre de la propriété
//           TextFormField(
//             validator: (value) => TValidator.validateEmptyText('Titre', value),
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.tag),
//               labelText: 'Nom de la propriété',
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Sous-titre
//           TextFormField(
//             validator: (value) =>
//                 TValidator.validateEmptyText('Sous-titre', value),
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.tag),
//               labelText: 'Localisation',
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Description
//           TextFormField(
//             validator: (value) =>
//                 TValidator.validateEmptyText('Description', value),
//             maxLines: 3,
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.document),
//               labelText: 'Description',
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Thumbnail
//           TextFormField(
//             validator: (value) =>
//                 TValidator.validateEmptyText('Thumbnail', value),
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.image),
//               labelText: 'Image',
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Chambres
//           TextFormField(
//             validator: (value) =>
//                 TValidator.validateEmptyText('Chambres', value),
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.home),
//               labelText: TTexts.rooms,
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Surface
//           TextFormField(
//             validator: (value) =>
//                 TValidator.validateEmptyText('Surface', value),
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.ruler),
//               labelText: TTexts.area,
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Prix
//           TextFormField(
//             validator: (value) => TValidator.validateEmptyText('Prix', value),
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.money),
//               labelText: TTexts.price,
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Statut
//           TextFormField(
//             validator: (value) => TValidator.validateEmptyText('Statut', value),
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.note),
//               labelText: TTexts.status,
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Propriétaire
//           TextFormField(
//             validator: (value) =>
//                 TValidator.validateEmptyText('Propriétaire', value),
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.user),
//               labelText: TTexts.owner,
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),

//           // Bouton de soumission
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () => controller.submitProperty(),
//               child: const Text(TTexts.submit),
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwSections),
//         ],
//       ),
//     );
//   }
// }
