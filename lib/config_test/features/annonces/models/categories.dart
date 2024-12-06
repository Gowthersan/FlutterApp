import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCategoriesModel {
  String title;
  IconData icon;
  TCategoriesModel({
    required this.title,
    required this.icon,
  });
}

List<TCategoriesModel> categories = [
  TCategoriesModel(title: 'Maisons', icon: Iconsax.house),
  TCategoriesModel(title: 'Villas', icon: Iconsax.house_2),
  TCategoriesModel(title: 'Studios', icon: Iconsax.house_2),
  TCategoriesModel(title: 'Immeubles', icon: Iconsax.buildings_2),
  TCategoriesModel(title: 'Bureaux', icon: Iconsax.buliding),
  TCategoriesModel(title: 'Appartements', icon: Iconsax.buildings),
];
