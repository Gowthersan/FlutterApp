import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/add_favoris.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/models/widgets/details_proprietes.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class TModelAnnonces extends StatelessWidget {
  const TModelAnnonces({
    super.key,
    required this.propertiesModel,
  });

  final TPropertiesModel propertiesModel;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 270,
        padding: const EdgeInsets.all(TSizes.defaultSpace - 15),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: dark ? TColors.darkGrey : TColors.grey,
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    height: TSizes.annoncesItemHeight,
                    width: double.infinity,
                    image: AssetImage(propertiesModel.thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 10,
                  right: 10,
                  child: TAddFavoris(
                    size: 28,
                  ), // Ajoutez le bien dans les favoris
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: TDetailsProprietesCard(
                      propertiesModel:
                          propertiesModel), // Détails du bien par le nombre de chambre et de douche
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              propertiesModel.title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.black)
                  .copyWith(
                      fontWeight: FontWeight.bold, fontSize: TSizes.fontSizeMd),
            ),
            const SizedBox(
              height: TSizes.xs,
            ),
            Text(
              propertiesModel.subTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.black),
            ),
          ],
        ));
  }
}
