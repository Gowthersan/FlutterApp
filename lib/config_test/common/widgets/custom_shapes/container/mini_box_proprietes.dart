import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/add_favoris.dart';
import 'package:mombien_test/config_test/features/annonces/models/details_annonces.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/details_proprietes_page.dart';
import 'package:mombien_test/core.dart';

class TOwnPropriete extends StatelessWidget {
  const TOwnPropriete({
    super.key,
    required this.propertiesModel,
    this.showStatus = true,
    this.showAction = false,
  });

  final TPropertiesModel propertiesModel;
  final bool showStatus;
  final bool showAction;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final List<TDetailsModel> details = [
      TDetailsModel(icon: Icons.bathtub, detail: '${propertiesModel.showers} '),
      TDetailsModel(icon: Icons.bed, detail: '${propertiesModel.rooms}'),
      TDetailsModel(
          icon: Icons.living, detail: '${propertiesModel.livingRoom} '),
      TDetailsModel(
          icon: Icons.square_foot, detail: '${propertiesModel.area} m²'),
    ];
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.to(
            () => TDetailsProprietesPage(propertiesModel: propertiesModel),
            transition: Transition.rightToLeft,
          ),
          child: Container(
            width: double.infinity,
            height: 138,
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.only(right: 1, top: 12, bottom: 12),
            decoration: BoxDecoration(
                color: dark ? TColors.darkerGrey : TColors.grey,
                borderRadius: BorderRadius.circular(TSizes.inputFieldRadius)),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(TSizes.inputFieldRadius),
                      bottomLeft: Radius.circular(TSizes.inputFieldRadius),
                    ),
                    child: Image(
                      height: double.infinity,
                      image: AssetImage(propertiesModel.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(propertiesModel.title,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(
                                    color: dark ? TColors.white : TColors.black)
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Iconsax.location,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              propertiesModel.subTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .apply(
                                      color:
                                          dark ? TColors.white : TColors.black)
                                  .copyWith(
                                    fontSize: 11,
                                  ),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: TCaracteristiquesP(
                            details: details,
                            height: 25,
                            size: 17,
                            showText: true,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Publié par : ${propertiesModel.owner}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(
                                  color: dark ? TColors.white : TColors.black)
                              .copyWith(
                                fontSize: 10,
                              ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        if (showStatus)
          Positioned(
            bottom: 16,
            right: 6,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: TColors.success,
                  borderRadius: BorderRadius.circular(TSizes.buttonWidth)),
              child: Text(
                propertiesModel.status,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: TColors.white)
                    .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        if (showAction)
          const Positioned(top: 20, right: 8, child: TAddFavoris(size: 18))
      ],
    );
  }
}
