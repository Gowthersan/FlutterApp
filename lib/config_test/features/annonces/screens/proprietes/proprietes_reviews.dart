import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/widgets/overall_prop_rating.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/widgets/rating.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/widgets/reviews_list.dart';
import 'package:mombien_test/core.dart';

class ProprietesReviewsScreen extends StatelessWidget {
  const ProprietesReviewsScreen({super.key, required this.propertiesModel});

  final TPropertiesModel propertiesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Revues & Notations',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Les évaluations et avis sont vérifiés et proviennent de personnes utilisant le même type d\'appareil que vous.',
                // textAlign: TextAlign.justify,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Notations
              TOverallProprietesRating(rating: propertiesModel.rating),
              TRating(rating: propertiesModel.rating),
              Text('999', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Commentaires des utilisateurs
              const UserReviewCard(rating: 2),
              const UserReviewCard(rating: 2),
              const UserReviewCard(rating: 2),
              const UserReviewCard(rating: 2),
            ],
          ),
        ),
      ),
    );
  }
}
