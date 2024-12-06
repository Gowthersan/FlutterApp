import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/device/device_utility.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class TSchearchContainer extends StatelessWidget {
  const TSchearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal_1,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
            width: TDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? TColors.dark
                      : TColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: TColors.grey) : null,
            ),
            child: Row(
              children: [
                Icon(icon, color: dark ? TColors.white : TColors.darkGrey),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(text,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: dark ? TColors.white : TColors.darkGrey)),
              ],
            )),
      ),
    );
  }
}
