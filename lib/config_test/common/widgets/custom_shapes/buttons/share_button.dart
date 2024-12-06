import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TShareButton extends StatelessWidget {
  const TShareButton({
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.5),
      decoration: BoxDecoration(
        color: TColors.grey.withOpacity(0.7),
        borderRadius: BorderRadius.circular(TSizes.buttonWidth),
      ),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            size: size,
            color: TColors.black,
          )),
    );
  }
}
