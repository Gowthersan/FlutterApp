import 'package:flutter/material.dart';

class TCartDetails extends StatelessWidget {
  const TCartDetails({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(title,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          flex: 0,
          child: Text(value,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
