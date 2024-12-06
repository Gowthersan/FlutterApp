import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';

class THorizontalIconText extends StatelessWidget {
  const THorizontalIconText({
    super.key,
    required this.icon,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.primary,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0), // Ajoute un peu d'espace entre les cercles
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Boxe circulaire
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth:
                    56, // Largeur minimale pour s'assurer que le cercle ne soit pas trop petit
                minHeight:
                    56, // Hauteur minimale pour garder la forme circulaire
              ),
              child: Container(
                padding: const EdgeInsets.all(8), // TSizes.sm
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icone et Texte
                    Icon(
                      icon,
                      color: TColors.white,
                    ),
                    const SizedBox(
                        width: 4), // Espace entre l'icône et le texte
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: textColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
