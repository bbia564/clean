import 'package:get/get.dart';

import 'cleaning_first_logic.dart';

class CleaningFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CleaningFirstLogic());
  }
}
