import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/images/cercle_image.dart';
import 'package:mombien_test/config_test/features/personnalisation/controllers/user_controller.dart';
import 'package:mombien_test/core.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      // height: 138,
      padding: const EdgeInsets.all(1.0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.grey,
          borderRadius: BorderRadius.circular(TSizes.annoncesItemHeight)),
      child: ListTile(
        leading: Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : TImages.user;
          return TImageCirculaire(
              image: image,
              padding: 0,
              width: 50,
              height: 50,
              isNetworkImage: networkImage.isNotEmpty);
        }),
        title: Text(controller.user.value.username,
            style: Theme.of(context).textTheme.headlineSmall),
        subtitle: Text(controller.user.value.email,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
        trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.edit,
                color: dark ? TColors.white : TColors.black)),
      ),
    );
  }
}
