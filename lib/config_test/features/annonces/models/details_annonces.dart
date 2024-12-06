import 'package:flutter/material.dart';

class TDetailsModel {
  final String detail;
  final IconData icon;

  TDetailsModel({
    required this.icon,
    required this.detail,
  });
}

class TCaracteristiquesP extends StatelessWidget {
  const TCaracteristiquesP(
      {super.key,
      required this.details,
      this.showText = true,
      this.height = 50,
      this.size});
  final bool showText;
  final double? height;
  final double? size;

  final List<TDetailsModel> details;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Ajustez la hauteur selon vos besoins
      child: TItems(details: details, size: size, showText: showText),
    );
  }
}

class TItems extends StatelessWidget {
  const TItems({
    super.key,
    required this.details,
    required this.size,
    required this.showText,
  });

  final List<TDetailsModel> details;
  final double? size;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: details.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              Icon(
                details[index].icon,
                size: size,
              ),
              const SizedBox(width: 4),
              if (showText) Text(details[index].detail),
            ],
          ),
        );
      },
    );
  }
}
