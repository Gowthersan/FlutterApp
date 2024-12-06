import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/tabbar.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/categories_buttons.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/grid_layout.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/search_container.dart';
import 'package:mombien_test/config_test/common/widgets/products/chat/notification_menu_icon.dart';
import 'package:mombien_test/config_test/common/widgets/texts/section_heading.dart';
import 'package:mombien_test/config_test/data/services/predictions/prediction.dart';
import 'package:mombien_test/config_test/features/annonces/models/categories.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/widgets/tab_proprietes.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class ProprieteScreen extends StatelessWidget {
  const ProprieteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.black
            : TColors.white,
        appBar: TAppBar(
          title: Text('Vos Propriétés',
              style: Theme.of(context).textTheme.headlineMedium),
          action: [
            TNotifCounterIcon(
                onPressed: () => Get.to(
                    () => const PredictionForm()), // Page vers la prédiction
                icon: Iconsax.chart_2,
                size: 28,
                showNotification: false)
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// Barre de recherche
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSchearchContainer(
                            text: 'Recherchez...',
                            showBackground: false,
                            showBorder: true,
                            padding: EdgeInsets.zero),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        ///Catégories
                        TSectionHeading(
                          title: 'Catégories',
                          showActionButton: true,
                          onPressed: () {},
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                        TGridLayout(
                            mainAxisExtent: 60,
                            itemCount: categories.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: TContainerForm(
                                    categoryModel: categories[index]),
                              );
                            }),
                      ],
                    ),
                  ),
                  bottom: const TTabBar(
                    tabs: [
                      Tab(child: Text('Toutes')),
                      Tab(child: Text('Achats')),
                      Tab(child: Text('Ventes')),
                      Tab(child: Text('Locations')),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                TStatutTab('Toutes', 'Toutes'),
                TStatutTab('Acheté', 'Achats'),
                TStatutTab('Vendu', 'Ventes'),
                TStatutTab('En location', 'Locations'),
              ],
            )),
      ),
    );
  }
}
