import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/bindings/general_bindings.dart';
import 'package:mombien_test/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
              color: Colors.white), //Chargement selon la rapidité
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
