import 'package:get/get.dart';

import 'cleaning_add_logic.dart';

class CleaningAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CleaningAddLogic());
  }
}
