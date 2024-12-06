import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/common/widgets/utiles_widgets/plustard.dart';
import 'package:mombien_test/core.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    required this.padding,
  });
  final String image;
  final double width;
  final double height;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      width: width,
      height: height,
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(
          height: TSizes.annoncesItemHeight,
          width: double.infinity,
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
