// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TProfilMenu extends StatelessWidget {
  const TProfilMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    this.title,
    this.value,
    this.flex = 5,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final title, value;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              flex: flex,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              flex: 0,
              child: Icon(icon, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
