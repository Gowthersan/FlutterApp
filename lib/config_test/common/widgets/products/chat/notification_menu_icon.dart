import 'package:flutter/material.dart';
import 'package:mombien_test/core.dart';

class TNotifCounterIcon extends StatelessWidget {
  const TNotifCounterIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
    this.icon,
    required this.size,
    this.showNotification = true,
  });

  final Color? iconColor;
  final VoidCallback onPressed;
  final IconData? icon;
  final double size;
  final bool showNotification;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: size,
            color: iconColor,
          )),
      if (showNotification)
        Positioned(
          right: 0,
          child: Container(
            width: 25,
            height: 19,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '3',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.textWhite, fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
    ]);
  }
}
