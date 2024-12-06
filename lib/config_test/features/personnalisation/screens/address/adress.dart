import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/address/add_new_adress.dart';
import 'package:mombien_test/config_test/features/personnalisation/screens/address/widgets/single_adress.dart';
import 'package:mombien_test/core.dart';

class UserAdressScreen extends StatelessWidget {
  const UserAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          mini: false,
          backgroundColor: TColors.primary,
          onPressed: () => Get.to(() => const AddNewAdressScreen(),
              transition: Transition.rightToLeft),
          child: const Icon(Iconsax.add, color: TColors.white)),
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Mes adresses',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              TSingleAdress(selectedAddress: true),
              TSingleAdress(selectedAddress: false),
              TSingleAdress(selectedAddress: true),
              TSingleAdress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
