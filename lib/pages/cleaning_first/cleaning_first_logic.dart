import 'dart:math';

import 'package:cleaning_plan/db_cleaning/cleaning_entity.dart';
import 'package:cleaning_plan/db_cleaning/db_cleaning.dart';
import 'package:get/get.dart';

class CleaningFirstLogic extends GetxController {
  DBCleaning dbCleaning = Get.find<DBCleaning>();

  var list = <CleaningEntity>[].obs;

  var planCount = 0.obs;

  void getData() async {
    final result = await dbCleaning.getCleaningAllData();
    final now = DateTime.now();
    list.value = result
        .where((e) =>
            e.createdTime.year == now.year &&
            e.createdTime.month == now.month &&
            e.createdTime.day == now.day)
        .toList();
    planCount.value = list.length;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
