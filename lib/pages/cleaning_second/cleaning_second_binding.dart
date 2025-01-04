import 'package:get/get.dart';

import 'cleaning_second_logic.dart';

class CleaningSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CleaningSecondLogic());
  }
}
