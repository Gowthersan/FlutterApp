// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/container/mini_box_proprietes.dart';
import 'package:mombien_test/config_test/common/widgets/texts/section_heading.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/core.dart';

Widget TStatutTab(String status, String tabTitle) {
  List<TPropertiesModel> filteredProperties = status == 'Toutes'
      ? properties
      : properties.where((property) => property.status == status).toList();

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace - 14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: status == 'Toutes'
                ? const TSectionHeading(
                    title: 'Tous vos biens',
                    showActionButton: false,
                  )
                : TSectionHeading(
                    title: 'Vos $tabTitle',
                    showActionButton: false,
                  ),
          ),
          const SizedBox(height: TSizes.defaultSpace - 14),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredProperties.length,
            itemBuilder: (context, index) {
              final dark = THelperFunctions.isDarkMode(context);
              final isLastItem = index == filteredProperties.length - 1;
              return Column(
                children: [
                  TOwnPropriete(
                    propertiesModel: filteredProperties[index],
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
    ),
  );
}
