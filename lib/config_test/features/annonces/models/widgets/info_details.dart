import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/models/details_annonces.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';

List<TDetailsModel> getDetailsForProperty(TPropertiesModel propertiesModel) {
  return [
    TDetailsModel(
      icon: Icons.bathtub,
      detail: '${propertiesModel.showers} douches',
    ),
    TDetailsModel(
      icon: Icons.bed,
      detail: '${propertiesModel.rooms} chambres',
    ),
    TDetailsModel(
      icon: Icons.stairs,
      detail: '${propertiesModel.floors} étages',
    ),
    TDetailsModel(
      icon: Icons.living,
      detail: '${propertiesModel.livingRoom} salons',
    ),
    TDetailsModel(
      icon: Icons.square_foot,
      detail: '${propertiesModel.area} m²',
    ),
  ];
}
