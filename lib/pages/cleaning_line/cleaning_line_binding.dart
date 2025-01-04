import 'package:get/get.dart';

import 'cleaning_line_logic.dart';

class CleaningLineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
