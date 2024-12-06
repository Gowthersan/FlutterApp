import 'package:get/get.dart';
import 'package:mombien_test/config_test/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
