import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class TUtilsWidget extends StatelessWidget {
  const TUtilsWidget({
    super.key,
    required this.propertiesModel,
    this.width = 250,
    required this.location,
    required this.price,
  });

  final double width;
  final String location;
  final int price;

  final TPropertiesModel propertiesModel;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      margin:
          const EdgeInsets.all(4), // Définir une largeur pour éviter l'erreur
      child: Container(
        padding: const EdgeInsets.all(4),
        width: 10,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
            color: TColors.grey.withOpacity(0.7)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(location,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(
                              color:
                                  dark ? TColors.darkerGrey : TColors.darkGrey)
                          .copyWith(fontSize: TSizes.fontSizeSm - 2)),
                ],
              ),
            ),
            const VerticalDivider(
              color: TColors.dark,
              width: 25,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${price / 10}/mois',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(
                              color:
                                  dark ? TColors.darkerGrey : TColors.darkGrey)
                          .copyWith(fontSize: TSizes.fontSizeSm - 4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
