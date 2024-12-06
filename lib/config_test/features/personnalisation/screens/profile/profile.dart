import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/common/widgets/images/cercle_image.dart';
import 'package:mombien_test/config_test/common/widgets/shimmers/shimmer.dart';
import 'package:mombien_test/config_test/common/widgets/texts/section_heading.dart';
import 'package:mombien_test/config_test/features/personnalisation/controllers/user_controller.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/profile/widgets/change_name.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/profile/widgets/profile_menu.dart';
import 'package:mombien_test/config_test/utils/constants/image_strings.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('Profil', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image =
                        networkImage.isNotEmpty ? networkImage : TImages.user;
                    return controller.imageUploading.value
                        ? const TShimmerEffect(width: 80, height: 80)
                        : TImageCirculaire(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty);
                  }),
                  TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Changer votre photo de profil')),
                ],
              ),
            ),

            ///--Détails
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeading(
                title: 'Informations du profil', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfilMenu(
                title: 'Nom',
                value: controller.user.value.lastName, //Nom
                onPressed: () => Get.to(() => const ChangeName())),
            TProfilMenu(
                title: 'Prénom',
                value: controller.user.value.firstName, // Prénom
                onPressed: () => Get.to(() => const ChangeName())),
            TProfilMenu(
                title: 'Utilisateur',
                value: controller.user.value.username,
                onPressed: () {}),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///--Informations personnelles
            const TSectionHeading(
                title: 'Vos Informations personnelles',
                showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            TProfilMenu(
                title: 'User ID',
                value: controller.user.value.id,
                onPressed: () {},
                icon: Iconsax.copy),
            TProfilMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {}),
            TProfilMenu(
                title: 'Téléphone',
                value: controller.user.value.phoneNumber,
                onPressed: () {}),
            TProfilMenu(title: 'Genre', value: 'Masculin', onPressed: () {}),
            TProfilMenu(title: 'Né le', value: '22 Mar 2002', onPressed: () {}),

            ///Supprimer le compte
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopUp(),
                  child: const Text('Supprimer le compte',
                      style: TextStyle(color: Colors.red))),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      )),
    );
  }
}
