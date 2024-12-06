import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/models/details_annonces.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/screens/cart/widgets/cart_validator.dart';
import 'package:mombien_test/config_test/features/annonces/screens/cart/widgets/infos_cart.dart';
import 'package:mombien_test/config_test/features/annonces/screens/cart/widgets/top_cart.dart';
import 'package:mombien_test/core.dart';

class TCartStructure extends StatelessWidget {
  const TCartStructure({
    super.key,
    required this.dark,
    required this.propertiesModel,
    required this.details,
  });

  final bool dark;
  final TPropertiesModel propertiesModel;
  final List<TDetailsModel> details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(TSizes.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.annoncesImageRadius),
            color: dark ? TColors.darkerGrey : TColors.grey,
          ),
          child: Column(
            children: [
              /// -- Top Panier détails
              TTopCart(propertiesModel: propertiesModel, details: details),

              //
              const SizedBox(height: TSizes.spaceBtwItems),
              Divider(color: dark ? TColors.white : TColors.grey),

              /// -- Infos Panier
              TInfoCart(propertiesModel: propertiesModel, dark: dark),
            ],
          ),
        ),
        const SizedBox(height: TSizes.sm),
        const TCartValidation()
      ],
    );
  }
}
