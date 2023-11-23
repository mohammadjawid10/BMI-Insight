import 'package:get/get.dart';

import '../helpers/state_controller.dart';

class StateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StateController());
  }
}