import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:mombien_test/core.dart';

class TSingleAdress extends StatelessWidget {
  const TSingleAdress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
        width: double.infinity,
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        backgroundColor: selectedAddress
            ? TColors.primary.withOpacity(0.5)
            : Colors.transparent,
        borderColor: selectedAddress
            ? Colors.transparent
            : dark
                ? TColors.darkerGrey
                : TColors.grey,
        margin: const EdgeInsets.all(TSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? TColors.light
                          : TColors.dark.withOpacity(0.7)
                      : null),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gauthier Morel',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: TSizes.sm / 2),
                const Text('555-555-5555',
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: TSizes.sm / 2),
                const Text(
                  '88888, St. Second Avenue 780, NY, USA, 8888, Canada',
                  softWrap: true,
                ),
              ],
            )
          ],
        ));
  }
}
