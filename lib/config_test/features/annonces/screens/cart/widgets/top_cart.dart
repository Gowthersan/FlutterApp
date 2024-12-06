import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/common/widgets/images/t_rounded_image.dart';
import 'package:mombien_test/config_test/features/annonces/models/details_annonces.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/core.dart';

class TTopCart extends StatelessWidget {
  const TTopCart({
    super.key,
    required this.propertiesModel,
    required this.details,
  });

  final TPropertiesModel propertiesModel;
  final List<TDetailsModel> details;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///-- Image de l'annonce
        TRoundedImage(
          imageUrl: propertiesModel.thumbnail,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(0),
          // backgroundColor: THelperFunctions.isDarkMode(context)
          //     ? TColors.darkGrey
          //     : TColors.light,
        ),

        ///-- Nom de l'annonce
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          width: 240,
          // height: 20,
          margin: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(propertiesModel.title,
                  style: Theme.of(context).textTheme.headlineSmall),
              Text(propertiesModel.subTitle,
                  style: Theme.of(context).textTheme.bodySmall),
              SizedBox(
                height: 20,
                child: TItems(
                  details: details,
                  size: 15,
                  showText: true,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
