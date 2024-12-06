import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TDetailsProprietesCard extends StatelessWidget {
  const TDetailsProprietesCard({
    super.key,
    required this.propertiesModel,
  });

  final TPropertiesModel propertiesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(
          right: 4), // Définir une largeur pour éviter l'erreur
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
                  const Icon(
                    Icons.bathtub,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${propertiesModel.showers}'),
                ],
              ),
            ),
            const VerticalDivider(
              color: TColors.dark,
              width: 10,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.bed,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${propertiesModel.rooms}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
