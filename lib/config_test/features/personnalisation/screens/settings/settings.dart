import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/common/widgets/list_tiles/user_profil_tile.dart';
import 'package:mombien_test/config_test/common/widgets/texts/section_heading.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/address/adress.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/profile/profile.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/settings/widgets/settings_menu_tile.dart';
import 'package:mombien_test/core.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ///Header
                ///AppBar
                TAppBar(
                    title: Text('Compte',
                        style: Theme.of(context).textTheme.headlineMedium)),

                ///Carte utilisateur profil
                TUserProfileTile(
                    onPressed: () => Get.to(
                          () => const ProfileScreen(),
                          transition: Transition.rightToLeft,
                        )),
                const SizedBox(height: TSizes.spaceBtwSections - 5),
              ],
            ),

            ///Body
            ///Liste des paramètres
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: 'Paramètres de compte'),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  ///
                  TSettingsMenuTile(
                      onTap: () => Get.to(() => const UserAdressScreen(),
                          transition: Transition.rightToLeft),
                      title: 'Mon adresse',
                      subtitle: 'Adresse de livraison',
                      icon: Iconsax.safe_home),
                  const TSettingsMenuTile(
                      title: 'Passez au paiement',
                      subtitle:
                          'Ajouter et supprimer des biens puis finaliser le paiement',
                      icon: Iconsax.shopping_cart),
                  const TSettingsMenuTile(
                      title: 'Mes contrats',
                      subtitle: 'Vos contrats en cours ou achévés',
                      icon: Iconsax.archive_book),
                  const TSettingsMenuTile(
                      title: 'Compte en Banque',
                      subtitle:
                          'Transférer le solde vers le compte bancaire enregistré',
                      icon: Iconsax.bank),
                  const TSettingsMenuTile(
                      title: 'Mes coupons',
                      subtitle: 'Listes de tous les coupons disponibles',
                      icon: Iconsax.discount_shape),
                  const TSettingsMenuTile(
                      title: 'Notifications',
                      subtitle:
                          'Configurer n\'importe quel message de notification',
                      icon: Iconsax.notification),
                  const TSettingsMenuTile(
                      title: 'Confidentialité',
                      subtitle:
                          'Gérer l\'utilisation des données et les comptes connectés',
                      icon: Iconsax.safe_home),

                  /// Paramètres de l'application
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'Paramètres de l\'application'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                      title: 'Chargement des données',
                      subtitle:
                          'Charger vos données depuis votre Cloud Firebase',
                      icon: Iconsax.document_upload),
                  TSettingsMenuTile(
                    title: 'GéoLocalisation',
                    subtitle:
                        'Suggérer votre position exacte pour trouver les biens',
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    title: 'Mode de sécurité',
                    subtitle:
                        'Le résultat de recherche est adapté à tous les âges',
                    icon: Iconsax.security_user,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    title: 'Qualité d\'image HD',
                    subtitle: 'Ajoutez des images en haute qualité',
                    icon: Iconsax.image,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  ///-- Déconnexion bouton
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: dark ? TColors.white : TColors.grey)),
                          onPressed: () => Get.offAll(() => const LoginScreen(),
                              transition: Transition.rightToLeft),
                          child: const Text('Se deconnecter'))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
