import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/custom_shapes/buttons/add_favoris.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/models/widgets/details_proprietes.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/details_proprietes_page.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TPAnnonces extends StatelessWidget {
  const TPAnnonces({
    super.key,
    required this.propertiesModel,
  });

  final TPropertiesModel propertiesModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return TDetailsProprietesPage(
              propertiesModel: propertiesModel,
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // L'animation commence à droite
            const end =
                Offset.zero; // L'animation se termine à la position normale
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      ),
      child: Container(
          width: double.infinity,
          height: 300,
          padding: const EdgeInsets.all(TSizes.defaultSpace - 15),
          margin: const EdgeInsets.only(right: 8, top: 12, bottom: 12),
          decoration: BoxDecoration(
              color: TColors.grey,
              borderRadius: BorderRadius.circular(TSizes.inputFieldRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      height: TSizes.annoncesItemHeight,
                      width: double.infinity,
                      image: AssetImage(propertiesModel.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: TAddFavoris(
                      size: 28,
                    ), // Ajoutez le bien dans les favoris
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: TDetailsProprietesCard(
                        propertiesModel:
                            propertiesModel), // Détails du bien par le nombre de chambre et de douche
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                propertiesModel.title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.black)
                    .copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: TSizes.fontSizeMd),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
              Text(
                propertiesModel.subTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.black),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: 190,
                    // height: 24,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(TSizes.borderRadiusLg),
                      color: TColors.primary,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '\$${propertiesModel.price} - \$${propertiesModel.price / 10}/mois', //Afficher le prix
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: TColors.light),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${propertiesModel.rating}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.black),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Iconsax.star1,
                        color: Color.fromARGB(255, 235, 198, 15),
                        size: 24,
                      ),
                    ],
                  ) // Dét
                ],
              ),
            ],
          )),
    );
  }
}
