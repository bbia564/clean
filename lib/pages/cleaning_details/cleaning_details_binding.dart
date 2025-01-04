import 'package:get/get.dart';

import 'cleaning_details_logic.dart';

class CleaningDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CleaningDetailsLogic());
  }
}
