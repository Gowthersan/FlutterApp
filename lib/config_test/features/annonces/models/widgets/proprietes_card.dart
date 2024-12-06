import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/screens/home/widgets/annonces.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/details_proprietes_page.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TProprietesCard extends StatelessWidget {
  const TProprietesCard({
    super.key,
    required this.propertiesModel,
  });

  final TPropertiesModel propertiesModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => TDetailsProprietesPage(propertiesModel: propertiesModel),
        transition: Transition.rightToLeft,
      ),
      child: Stack(
        children: [
          TModelAnnonces(propertiesModel: propertiesModel),
          Positioned(
            bottom: 14,
            left: 12,
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 180,
              // height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                color: TColors.primary,
              ),
              child: Text(
                '\$${propertiesModel.price} - \$${propertiesModel.price / 10}/mois',
                maxLines: 1,
                overflow: TextOverflow.ellipsis, //Afficher le prix
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: TColors.light),
              ),
            ),
          ),
          Positioned(
              bottom: 24,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${propertiesModel.rating}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: TColors.black),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  const Icon(
                    Iconsax.star1,
                    color: Color.fromARGB(255, 235, 198, 15),
                    size: 24,
                  ),
                ],
              ) // Détails du bien par le nombre de chambre et de douche
              ),
        ],
      ),
    );
  }
}
