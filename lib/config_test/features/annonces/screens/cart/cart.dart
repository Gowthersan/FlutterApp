// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/features/annonces/models/details_annonces.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/models/widgets/info_details.dart';
import 'package:mombien_test/config_test/features/annonces/screens/cart/widgets/cart_structure.dart';
import 'package:mombien_test/core.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Aperçu', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 1,
          itemBuilder: (_, index) {
            /// -- Liste des propriétés à valider
            final dark = THelperFunctions.isDarkMode(context);
            final TPropertiesModel propertiesModel = properties[index];
            final List<TDetailsModel> details =
                getDetailsForProperty(propertiesModel);
            return TCartStructure(
                dark: dark, propertiesModel: propertiesModel, details: details);
          },
        ),
      ),
      // bottomNavigationBar: Container(
      //     padding: EdgeInsets.only(top: TSizes.defaultSpace),
      //     child:
      //         ElevatedButton(onPressed: () {}, child: Text('Valider  \$5000'))),
    );
  }
}
