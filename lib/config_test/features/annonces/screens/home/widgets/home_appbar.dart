import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/common/widgets/images/cercle_image.dart';
import 'package:mombien_test/config_test/common/widgets/products/chat/notification_menu_icon.dart';
import 'package:mombien_test/config_test/common/widgets/shimmers/shimmer.dart';
import 'package:mombien_test/config_test/features/personnalisation/controllers/user_controller.dart';
import 'package:mombien_test/core.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    return TAppBar(
      title: Row(
        children: [
          Obx(() {
            final networkImage = controller.user.value.profilePicture;
            final image = networkImage.isNotEmpty ? networkImage : TImages.user;
            return TImageCirculaire(
                image: image,
                width: 70,
                height: 70,
                isNetworkImage: networkImage.isNotEmpty);
          }),
          const SizedBox(width: TSizes.xs),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.homeAppbarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: darkMode ? TColors.grey : TColors.dark),
              ),
              Obx(() {
                if (controller.profileLoading.value) {
                  return const TShimmerEffect(width: 80, height: 15);
                } else {
                  return Text(controller.user.value.username,
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                          color: darkMode ? TColors.white : TColors.dark));
                }
              })
            ],
          ),
        ],
      ),
      action: [
        TNotifCounterIcon(
            onPressed: () {},
            icon: Iconsax.notification,
            size: 24,
            iconColor: darkMode ? TColors.white : TColors.dark),
        TNotifCounterIcon(
            onPressed: () {},
            icon: Iconsax.send_2,
            size: 24,
            iconColor: darkMode ? TColors.white : TColors.dark),
      ],
    );
  }
}
