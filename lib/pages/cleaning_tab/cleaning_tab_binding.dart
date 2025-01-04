import 'package:get/get.dart';

import '../cleaning_first/cleaning_first_logic.dart';
import '../cleaning_second/cleaning_second_logic.dart';
import 'cleaning_tab_logic.dart';

class CleaningTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CleaningTabLogic());
    Get.lazyPut(() => CleaningFirstLogic());
    Get.lazyPut(() => CleaningSecondLogic());
  }
}
