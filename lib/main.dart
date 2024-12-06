import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mombien_test/config_test/data/repositories/authentification/authentication_repository.dart';
import 'package:mombien_test/firebase_options.dart';

import 'app.dart';

Future<void> main() async {
  //Bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // -- GetX Storage
  await GetStorage.init();

  // --Await Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //Application
  runApp(const App());
}

// Test Sans Firebase
// void main() {
//   runApp(const App());
// }
