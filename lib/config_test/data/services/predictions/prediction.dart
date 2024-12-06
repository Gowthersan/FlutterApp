// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:mombien_test/config_test/common/widgets/appbar/appbar.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class PredictionForm extends StatefulWidget {
  const PredictionForm({super.key});

  @override
  _PredictionFormState createState() => _PredictionFormState();
}

class _PredictionFormState extends State<PredictionForm> {
  final TextEditingController _surfaceController = TextEditingController();
  final TextEditingController _piecesController = TextEditingController();
  final TextEditingController _chambreController = TextEditingController();
  final TextEditingController _sdbController = TextEditingController();
  final TextEditingController _etatController = TextEditingController();
  final TextEditingController _villeController = TextEditingController();
  final TextEditingController _quartierController = TextEditingController();

  String? _prediction;

  // Fonction pour envoyer la requête POST à l'API Flask
  Future<void> _getPrediction() async {
    // final url = Uri.parse('http://127.0.0.1:5000/predict');
    final url = Uri.parse('https://flask-api-4-2xia.onrender.com/predict');
    // bon lien : https://flask-api-4-2xia.onrender.com/predict

    final Map<String, dynamic> houseData = {
      'surface': int.parse(_surfaceController.text),
      'pieces': int.parse(_piecesController.text),
      'chambre': int.parse(_chambreController.text),
      'sdb': int.parse(_sdbController.text),
      'etat': _etatController.text,
      'ville': _villeController.text,
      'quartier': _quartierController.text
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(houseData),
      );

      final responseData = jsonDecode(response.body);

      setState(() {
        _prediction = responseData['prediction'].toString();
      });
    } catch (error) {
      if (kDebugMode) {
        print('Erreur : $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Prédictions',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TextFormField(
                controller: _surfaceController,
                keyboardType: TextInputType.number,
                expands: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.maximize_4),
                    labelText: 'Surface (m²)',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeFactor: 0.9)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _piecesController,
                expands: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.grid_3),
                    labelText: 'Nombre de pièces',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeFactor: 0.9)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _chambreController,
                expands: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.moon),
                    labelText: 'Nombre de chambres',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeFactor: 0.9)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _sdbController,
                expands: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.paintbucket),
                    labelText: 'Nombre de salles de bain',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeFactor: 0.9)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _etatController,
                expands: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.menu_board),
                    labelText: 'État de la maison',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeFactor: 0.9)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _villeController,
                expands: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.building),
                    labelText: 'Ville',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeFactor: 0.9)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _quartierController,
                expands: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.buliding),
                    labelText: 'Quartier',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeFactor: 0.9)),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              ElevatedButton(
                onPressed: _getPrediction,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.iconLg),
                  ),
                  backgroundColor: TColors.primary,
                  foregroundColor: TColors.white,
                  padding: const EdgeInsets.all(TSizes.buttonRadius),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Obtenir Prédiction'),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              if (_prediction != null)
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(TSizes.defaultSpace),
                    border: Border.all(color: TColors.success),
                    color: TColors.success,
                  ),
                  child: Text(
                    'Prédiction : $_prediction MAD',
                    style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: TColors.light,
                        fontWeightDelta: 1,
                        fontSizeFactor: 1),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
