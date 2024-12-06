import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/features/annonces/screens/favoris/favoritescreen.dart';
import 'package:mombien_test/config_test/features/annonces/screens/home/home.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/add_property_screen.dart';
import 'package:mombien_test/config_test/features/annonces/screens/proprietes/propriete_page.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/settings/settings.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).brightness == Brightness.dark
          ? TColors.black
          : TColors.white,
      systemNavigationBarColor: Theme.of(context).brightness == Brightness.dark
          ? TColors.black
          : TColors.white,
    ));

    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,

      ///Bouton flotant en bas

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: TColors.buttonPrimary,
      //   foregroundColor: TColors.textWhite,
      //   elevation: 0,
      //   shape: const CircleBorder(),
      //   mini: true,
      //   child: const Icon(Iconsax.add),
      // ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            border:
                Border(top: BorderSide(color: TColors.darkGrey, width: 0.4)),
          ), // L'épaisseur de la ligne
          child: NavigationBar(
            height: 70,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? TColors.black : TColors.white,
            indicatorColor: darkMode
                ? TColors.light.withOpacity(0.1)
                : TColors.dark.withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                label: 'Accueil',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.buildings_2),
                label: 'Propriétés',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.add_circle),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.heart),
                label: 'Favoris',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.user),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ProprieteScreen(),
    const AddPropertyScreen(),
    const Favoritescreen(),
    const SettingsScreen(),
  ];
}
