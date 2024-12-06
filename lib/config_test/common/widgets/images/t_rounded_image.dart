import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width = 400,
    this.height = 100,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
    this.wiidth = 400,
  });

  final double? width, wiidth, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: Container(
          width: width, // Largeur de la bannière
          height: height,
          padding: padding, // Hauteur de la bannière
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            color: backgroundColor,
          ),
          child: Image(
            fit: fit,
            width: wiidth,
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl)
                    as ImageProvider, // Adapter l'image pour qu'elle remplisse le conteneur tout en maintenant son rapport d'aspect
          ),
        ),
      ),
    );
  }
}
