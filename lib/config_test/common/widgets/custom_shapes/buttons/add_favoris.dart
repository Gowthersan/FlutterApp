// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TAddFavoris extends StatefulWidget {
  const TAddFavoris({
    super.key,
    required this.size,
  });

  final double size;
  // final Color color;

  @override
  _TAddFavorisState createState() => _TAddFavorisState();
}

class _TAddFavorisState extends State<TAddFavoris> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorited = !_isFavorited;
          // Ajoutez ici l'action à effectuer lorsque l'icône est cliquée
        });
      },
      child: Container(
        padding: const EdgeInsets.all(TSizes.xs),
        decoration: BoxDecoration(
          color: TColors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(TSizes.buttonWidth),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              _isFavorited ? Iconsax.heart5 : Iconsax.heart,
              color: _isFavorited ? Colors.red : TColors.black,
              size: widget.size,
            ),
          ],
        ),
      ),
    );
  }
}
