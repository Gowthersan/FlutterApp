import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/add_favoris.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/back_button.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/button_elevated.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/share_button.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/rounded_text_container.dart';
import 'package:mombien_test/config_test/common/widgets/texts/section_heading.dart';
import 'package:mombien_test/config_test/common/widgets/utiles_widgets/divided_widget.dart';
import 'package:mombien_test/config_test/features/annonces/models/details_annonces.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/models/widgets/rating_annonces.dart';
import 'package:mombien_test/config_test/features/annonces/screens/cart/cart.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/proprietes_reviews.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/widgets/slider_images.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class TDetailsProprietesPage extends StatelessWidget {
  final TPropertiesModel propertiesModel;

  const TDetailsProprietesPage({
    super.key,
    required this.propertiesModel,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final List<TDetailsModel> details = [
      TDetailsModel(
          icon: Icons.bathtub, detail: '${propertiesModel.showers} douches'),
      TDetailsModel(
          icon: Icons.bed, detail: '${propertiesModel.rooms} chambres'),
      TDetailsModel(
          icon: Icons.stairs, detail: '${propertiesModel.floors} étages'),
      TDetailsModel(
          icon: Icons.living, detail: '${propertiesModel.livingRoom} salons'),
      TDetailsModel(
          icon: Icons.square_foot, detail: '${propertiesModel.area} m²'),
    ];

    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CarouselwithIndicatorDemo(
                  propertiesModel: propertiesModel,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Prix de la propriété
                      Text(
                        ' \$${propertiesModel.price} - ${propertiesModel.category}',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: dark ? TColors.light : TColors.black)
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: TSizes.fontSizeLg * 1.5),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      ///Disponibilité
                      TUtilsWidget(
                        propertiesModel: propertiesModel,
                        location: 'Disponible',
                        price: propertiesModel.price,
                      ),
                      const SizedBox(
                        height: TSizes.md,
                      ),

                      ///Nom et localisation de la propriété
                      Row(children: [
                        Text(
                          propertiesModel.title,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(
                                  color: dark ? TColors.light : TColors.black)
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: TSizes.fontSizeLg),
                        ),
                      ]),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.location,
                              size: 16,
                              color: dark ? TColors.light : TColors.black),
                          const SizedBox(
                            width: TSizes.sm,
                          ),
                          Text(
                            propertiesModel.subTitle,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(
                                    color:
                                        dark ? TColors.light : TColors.black),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      Divider(
                        color: dark ? TColors.grey : TColors.darkerGrey,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems - 5,
                      ),

                      ///Caracteristiques
                      TCaracteristiquesP(details: details),
                      const SizedBox(
                        height: TSizes.spaceBtwItems - 5,
                      ),
                      Divider(
                        color: dark ? TColors.grey : TColors.darkerGrey,
                      ),

                      ///Description
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Text('Description',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(
                                  color: dark ? TColors.light : TColors.black)
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: TSizes.fontSizeMd,
                              )),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// --Text Container
                      TRoundedTextContainer(
                        text: propertiesModel.description,
                        textColor: TColors.light,
                        color: dark ? TColors.darkerGrey : TColors.darkGrey,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(TSizes.cardRadiusMd)),
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwItems - 5,
                      ),
                      Divider(
                        color: dark ? TColors.grey : TColors.darkerGrey,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      ///Notations
                      TRatingWidget(rating: propertiesModel.rating),

                      //
                      const SizedBox(
                        height: TSizes.spaceBtwItems - 5,
                      ),
                      Divider(
                        color: dark ? TColors.grey : TColors.darkerGrey,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections / 1.8,
                      ),

                      ///Commentaires
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TSectionHeading(
                            title: 'Commentaires',
                          ),
                          IconButton(
                              onPressed: () => Get.to(
                                    () => ProprietesReviewsScreen(
                                        propertiesModel: propertiesModel),
                                    transition: Transition.rightToLeft,
                                  ),
                              icon:
                                  const Icon(Iconsax.arrow_right_3, size: 18)),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Divider(
                        color: dark ? TColors.grey : TColors.darkerGrey,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      const SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 50,
            right: 20,
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: 8.0), // Espace entre les boutons
                    child: TAddFavoris(size: 36),
                  ),
                  TShareButton(size: 28),
                ],
              ),
            ),
          ), // Ajouter aux Favoris
          const Positioned(
              top: 50,
              left: 20,
              child: TBackPageButton(size: 28)), // Retour page précedente

          ///Boutons flotant
          Positioned(
              bottom: 40,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TButtonElevated(
                      text: '', icon: Iconsax.call, showIcon: true),
                  const TButtonElevated(
                      text: '', icon: Iconsax.message, showIcon: true),
                  TButtonElevated(
                    text: 'Prendre rendez-vous',
                    onTap: () => Get.to(() => const CartScreen(),
                        transition: Transition.rightToLeft),
                    width: 240,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
