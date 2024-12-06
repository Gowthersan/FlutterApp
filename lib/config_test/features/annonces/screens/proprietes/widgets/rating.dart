import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/core.dart';

class TRating extends StatelessWidget {
  const TRating({
    super.key,
    this.rating = 0,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) => const Icon(Iconsax.star1, color: TColors.primary),
    );
  }
}
