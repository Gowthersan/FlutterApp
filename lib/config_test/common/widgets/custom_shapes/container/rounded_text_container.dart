import 'package:flutter/material.dart';

class TRoundedTextContainer extends StatelessWidget {
  const TRoundedTextContainer({
    super.key,
    required this.text,
    this.textColor,
    this.padding = const EdgeInsets.all(16.0),
    this.height,
    this.borderRadius,
    this.color,
    this.width = double.infinity,
  });

  final String text;
  final Color? color, textColor;
  final EdgeInsets? padding;
  final double? width, height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius, color: color),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.apply(color: textColor),
      ),
    );
  }
}
