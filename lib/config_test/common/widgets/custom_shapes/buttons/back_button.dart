import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TBackPageButton extends StatelessWidget {
  const TBackPageButton({
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.5),
      decoration: BoxDecoration(
        color: TColors.grey.withOpacity(0.9),
        borderRadius: BorderRadius.circular(TSizes.buttonWidth),
      ),
      child: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Iconsax.arrow_left,
            size: size,
            color: TColors.black,
          )),
    );
  }
}
