import 'package:flutter/material.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double? mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Augmenter la hauteur pour accommoder le GridView
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // Définir une largeur fixe
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: mainAxisExtent,
            crossAxisCount: 2,
            childAspectRatio: 1 / 0.4,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
