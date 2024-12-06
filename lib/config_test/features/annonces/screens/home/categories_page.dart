import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/new_annonce.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/search_container.dart';
import 'package:mombien_test/config_test/common/widgets/texts/section_heading.dart';
import 'package:mombien_test/config_test/features/annonces/models/categories.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class TCategoriesPage extends StatelessWidget {
  final TCategoriesModel categoryModel;

  const TCategoriesPage({
    super.key,
    required this.categoryModel,
    this.showBackground = true,
    this.showBorder = true,
  });

  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    // Filtrer les propriétés selon la catégorie
    final filteredProperties = properties.where((property) {
      return property.category == categoryModel.title;
    }).toList();

    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace - 22),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: TSizes.defaultSpace * 5,
                      width: 4,
                    ),

                    ///
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Iconsax.arrow_left,
                            color: dark ? TColors.white : TColors.black)),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Text(
                      categoryModel.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: dark ? TColors.white : TColors.black)
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),

                ///
                Column(
                  children: [
                    TSchearchContainer(
                        text: 'Recherchez villes, rues,...', onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),

                ///
                Padding(
                  padding: const EdgeInsets.only(
                      top: TSizes.defaultSpace - 10,
                      left: TSizes.defaultSpace,
                      right: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      const TSectionHeading(
                        title: 'Populaires',
                        showActionButton: true,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),

                      ///
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filteredProperties.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TPAnnonces(
                              propertiesModel: filteredProperties[index],
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
