import 'package:flutter/material.dart';
import 'package:mombien_test/core.dart';

class TCartValidation extends StatelessWidget {
  const TCartValidation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  foregroundColor: TColors.primary, // Couleur du texte
                  side: const BorderSide(color: TColors.primary),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.iconLg))
                  // Couleur de la bordure
                  ),
              child: const Text(
                'Valider',
                maxLines: 1,
              )),
        ),
        const SizedBox(width: TSizes.sm),
        Expanded(
          flex: 2,
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  foregroundColor: TColors.error, // Couleur du texte
                  side: const BorderSide(color: TColors.error),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.iconLg))
                  // Couleur de la bordure
                  ),
              child: const Text('Annuler')),
        )
      ],
    );
  }
}
