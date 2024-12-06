import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/models/widgets/proprietes_card.dart';

class TRecommandations extends StatelessWidget {
  const TRecommandations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: properties.length,
        itemBuilder: (BuildContext context, int index) {
          final TPropertiesModel propertiesModel = properties[index];
          return TProprietesCard(
            propertiesModel: propertiesModel,
          );
        },
      ),
    );
  }
}
