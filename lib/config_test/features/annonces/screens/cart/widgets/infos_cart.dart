import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/screens/cart/widgets/cart_details.dart';
import 'package:mombien_test/core.dart';

class TInfoCart extends StatelessWidget {
  const TInfoCart({
    super.key,
    required this.propertiesModel,
    required this.dark,
  });

  final TPropertiesModel propertiesModel;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TCartDetails(title: 'Publié par : ', value: propertiesModel.owner),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          TCartDetails(
              title: 'Caution : ', value: '\$${propertiesModel.price / 10}'),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          TCartDetails(
              title: 'TVA : ',
              value:
                  '${propertiesModel.price * 0.02 - propertiesModel.price * 0.01}%'),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          TCartDetails(
              title: 'TAXE : ', value: '\$${propertiesModel.price * 0.1 / 10}'),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          const TCartDetails(title: 'Frais entreprise : ', value: '\$${150}'),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          TCartDetails(title: 'Prix: ', value: '\$${propertiesModel.price}'),
          const SizedBox(height: TSizes.spaceBtwItems),
          Divider(color: dark ? TColors.white : TColors.grey),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          TCartDetails(
              title: 'Prix Total : ',
              value:
                  '\$${propertiesModel.price + 150 + propertiesModel.price / 10 + propertiesModel.price * 0.2 / 10 + propertiesModel.price * 0.1 / 10}'),
        ],
      ),
    );
  }
}
