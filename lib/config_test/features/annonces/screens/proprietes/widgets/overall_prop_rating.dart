import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/widgets/progress_rating_indicator.dart';

class TOverallProprietesRating extends StatelessWidget {
  const TOverallProprietesRating({
    super.key,
    this.rating = 0,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child:
              Text('$rating', style: Theme.of(context).textTheme.displayLarge),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: '5', value: 1.0),
              TRatingProgressIndicator(text: '4', value: .8),
              TRatingProgressIndicator(text: '3', value: .6),
              TRatingProgressIndicator(text: '2', value: .4),
              TRatingProgressIndicator(text: '1', value: .2),
            ],
          ),
        ),
      ],
    );
  }
}
