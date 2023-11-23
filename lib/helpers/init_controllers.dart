import 'package:get/get.dart';

import '../helpers/state_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => StateController());
}
