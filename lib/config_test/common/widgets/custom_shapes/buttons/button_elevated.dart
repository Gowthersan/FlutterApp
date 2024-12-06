import 'package:flutter/material.dart';
import 'package:mombien_test/core.dart';

class TButtonElevated extends StatelessWidget {
  const TButtonElevated({
    super.key,
    required this.text,
    this.icon,
    this.showIcon = false,
    this.width,
    this.onTap,
  });
  final String text;
  final IconData? icon;
  final bool showIcon;
  final double? width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: TColors.primary.withOpacity(0.9),
          borderRadius: BorderRadius.circular(TSizes.buttonWidth),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showIcon)
              Icon(icon, size: 20, color: dark ? TColors.light : TColors.grey),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: dark ? TColors.light : TColors.grey)
                  .copyWith(
                      fontWeight: FontWeight.bold, fontSize: TSizes.fontSizeMd),
            ),
          ],
        )),
      ),
    );
  }
}
