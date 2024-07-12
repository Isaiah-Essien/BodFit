import 'package:bodFit_group5_summative/utils/device/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
