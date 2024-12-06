import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/widgets/rating.dart';
import 'package:mombien_test/core.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, this.rating = 0});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage3)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Ziph Urie',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///Commentaires
        Row(
          children: [
            TRating(rating: rating),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01 Sep, 2024', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'Bonjour ! Votre application m\'a permis de pouvoir trouver la meilleure propriété pour ma famille beau travail à vous tous ! Je retourne dans mes achats !',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'voir moins',
          trimCollapsedText: 'voir plus',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///Admin commentaires
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
              color: dark ? TColors.darkerGrey : TColors.grey),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Admin', style: Theme.of(context).textTheme.bodyLarge),
                    Text('03 Sep, 2024',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'Bonjour ! Votre application m\'a permis de pouvoir trouver la meilleure propriété pour ma famille beau travail à vous tous ! Je retourne dans mes achats !',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'voir moins',
                  trimCollapsedText: 'voir plus',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
