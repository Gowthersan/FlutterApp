import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/common/widgets/shimmers/shimmer.dart';
import 'package:mombien_test/core.dart';

class TImageCirculaire extends StatelessWidget {
  const TImageCirculaire(
      {super.key,
      this.width = 56,
      this.height = 56,
      required this.image,
      this.backgroundColor,
      this.fit,
      this.padding = TSizes.sm,
      this.isNetworkImage = false,
      this.borderRadius = 100,
      this.overlayColor});

  final double width, height, padding;
  final String image;

  final Color? backgroundColor;
  final BoxFit? fit;
  final Color? overlayColor;
  final bool isNetworkImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Largeur de la bannière
      height: height,
      padding: EdgeInsets.all(padding), // Hauteur de la bannière
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const TShimmerEffect(width: 55, height: 55, radius: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color:
                      overlayColor, // Adapter l'image pour qu'elle remplisse le conteneur tout en maintenant son rapport d'aspect
                ),
        ),
      ),
    );
  }
}
