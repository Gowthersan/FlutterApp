import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class TRatingWidget extends StatelessWidget {
  final double rating; // La note sur 5

  const TRatingWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(TSizes.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Note : ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: dark ? TColors.light : TColors.black)
                  .copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeLg,
                  )),
          const SizedBox(
            width: TSizes.spaceBtwItems - 5,
          ),
          Row(
            children: [
              RatingBarIndicator(
                rating: rating,
                itemSize: 40,
                unratedColor: TColors.grey,
                itemBuilder: (_, __) =>
                    const Icon(Iconsax.star1, color: TColors.primary),
              )
            ],
            // children: List.generate(5, (index) {
            //   if (index < fullStars) {
            //     return const Icon(Icons.star, color: TColors.primary, size: 30);
            //   } else if (index == fullStars && halfStar >= 0.5) {
            //     return const Icon(Icons.star_half,
            //         color: TColors.primary, size: 30);
            //   } else {
            //     return const Icon(Icons.star_border,
            //         color: TColors.primary, size: 30);
            //   }
            // }),
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems - 5,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: 34,
            decoration: BoxDecoration(
                color: TColors.secondary,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
            child: Text(
              '$rating',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: TColors.darkGrey),
            ),
          )
        ],
      ),
    );
  }
}
