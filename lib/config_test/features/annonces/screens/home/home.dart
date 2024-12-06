// ignore_for_file: unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/search_container.dart';
import 'package:mombien_test/config_test/common/widgets/icon_texts_widgets/horizontal_icon_text.dart';
import 'package:mombien_test/config_test/common/widgets/images/t_rounded_image.dart';
import 'package:mombien_test/config_test/common/widgets/products/chat/notification_menu_icon.dart';
import 'package:mombien_test/config_test/common/widgets/texts/section_heading.dart';
import 'package:mombien_test/config_test/common/widgets/utiles_widgets/plustard.dart';
import 'package:mombien_test/config_test/features/annonces/models/categories.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/models/widgets/proprietes_card.dart';
import 'package:mombien_test/config_test/features/annonces/screens/home/widgets/home_appbar.dart';
import 'package:mombien_test/config_test/features/annonces/screens/home/widgets/home_categories.dart';
import 'package:mombien_test/config_test/features/annonces/screens/home/widgets/promo_slider.dart';
import 'package:mombien_test/config_test/features/annonces/screens/home/widgets/recommandations.dart';
import 'package:mombien_test/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                // AppBar Accueil
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                //
                const THomeAppBar(),
                //
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                // Barre de recherche
                TSchearchContainer(
                  text: "Recherchez villes, rues,...",
                  onTap: () {},
                ),
                //
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                // Catégories
                const Padding(
                  padding: EdgeInsets.only(
                      left: TSizes.defaultSpace - 8,
                      right: TSizes.defaultSpace - 8),
                  child: Column(
                    children: [
                      /// Heading
                      TSectionHeading(
                        title: '  Catégories Populaires',
                        showActionButton: false,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      ///Catégories
                      THomeCategories(),
                    ],
                  ),
                ),
              ],
            ),

            /// Body
            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TPromoSlider(
                banners: [
                  TImages.promoBanner1,
                  TImages.promoBanner2,
                  TImages.promoBanner3,
                  TImages.promoBanner4,
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            ///Recommendations
            const Padding(
              padding: EdgeInsets.only(
                  left: TSizes.defaultSpace, right: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Recommendations',
                    showActionButton: true,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Ajouter les propriétés
                  TRecommandations(),

                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            //Les propriétés populaires
            // ignore: prefer_const_constructors
            // Column(
            //   children: [
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: TSizes.defaultSpace, right: TSizes.defaultSpace),
            //   child: Column(
            //     children: [
            //       const TSectionHeading(
            //         title: 'Populaires',
            //         showActionButton: false,
            //       ),
            //       const SizedBox(
            //         height: TSizes.spaceBtwItems,
            //       ),
            //       SizedBox(
            //         height: 300,
            //         child: ListView.builder(
            //           scrollDirection: Axis.vertical,
            //           shrinkWrap: true,
            //           itemCount:
            //               properties.length > 1 ? 1 : properties.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             final TPropertiesModel propertiesModel =
            //                 properties[index];
            //             return TProprietesCard(
            //                 propertiesModel: propertiesModel);
            //           },
            //         ),
            //       ),
            //       /// Ajouter les propriétés
            //     ],
            //   ),
            // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
