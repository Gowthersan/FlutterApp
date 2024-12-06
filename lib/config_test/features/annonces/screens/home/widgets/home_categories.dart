import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/categories_buttons.dart';
import 'package:mombien_test/config_test/features/annonces/models/categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75, // Ajuster la hauteur pour accommoder le ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Défilement horizontal
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 2.0 * 1.5), // Espacement entre les éléments
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.45, // Ajuster la largeur de chaque item
              child: TCategoriesButton(
                categoryModel: categories[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
