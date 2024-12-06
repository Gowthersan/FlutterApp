import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/mini_box_proprietes.dart';
import 'package:mombien_test/config_test/common/widgets/products/chat/notification_menu_icon.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/core.dart';

class Favoritescreen extends StatelessWidget {
  const Favoritescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      appBar: TAppBar(
        title:
            Text('Favoris', style: Theme.of(context).textTheme.headlineMedium),
        action: [
          TNotifCounterIcon(
              onPressed: () {},
              icon: Iconsax.add,
              size: 28,
              showNotification: false)
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace - 8),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: properties.length,
              itemBuilder: (context, index) {
                final dark = THelperFunctions.isDarkMode(context);
                final isLastItem = index == properties.length - 1;
                return Column(
                  children: [
                    TOwnPropriete(
                      propertiesModel: properties[index],
                      showStatus: false,
                      showAction: true,
                    ),
                    if (!isLastItem) // Le trait ne s'affichera pas au dernier bien
                      Divider(
                        color: dark ? TColors.grey : TColors.darkerGrey,
                        thickness: 0.5,
                        indent: 15,
                        endIndent: 15,
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
