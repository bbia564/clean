import 'package:cleaning_plan/db_cleaning/cleaning_entity.dart';
import 'package:cleaning_plan/db_cleaning/db_cleaning.dart';
import 'package:cleaning_plan/pages/cleaning_details/cleaning_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class CleaningDetailsLogic extends GetxController {
  DBCleaning dbCleaning = Get.find<DBCleaning>();

  int type = Get.arguments;

  CleaningEntity? cleaningEntity;

  void getData() async {
    final result = await dbCleaning.getCleaningAllData();
    final now = DateTime.now();
    final hereValue = result
        .where((e) =>
            e.createdTime.year == now.year &&
            e.createdTime.month == now.month &&
            e.createdTime.day == now.day)
        .toList();
    cleaningEntity =
        hereValue.firstWhereOrNull((element) => element.type == type);
    update();
  }

  addData() async {
    String title = '';
    Get.dialog(AlertDialog(
      title: const Text(
        'Add',
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: double.infinity,
        height: 50,
        child: CleaningTextField(
            value: title,
            hintText: 'Please enter the title',
            maxLength: 20,
            textAlign: TextAlign.center,
            onChange: (value) {
              title = value;
            }),
      ).decorated(
          border: Border.all(color: const Color(0xffd3d3d3)),
          borderRadius: BorderRadius.circular(12)),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (title.isEmpty) {
              Fluttertoast.showToast(msg: 'Please enter the title');
              return;
            }
            if (cleaningEntity == null) {
              await dbCleaning.insertCleaning(CleaningEntity(
                id: 0,
                createdTime: DateTime.now(),
                type: type,
                list: [
                  PlanEntity(
                    title: title,
                    createdTime: DateTime.now(),
                    hadDone: 0,
                  )
                ],
              ));
            } else {
              cleaningEntity!.list.add(PlanEntity(
                title: title,
                createdTime: DateTime.now(),
                hadDone: 0,
              ));
              await dbCleaning.updateCleaning(cleaningEntity!);
            }
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ));
  }

  void updateStatus(PlanEntity entity) async {
    entity.hadDone = entity.hadDone == 0 ? 1 : 0;
    await dbCleaning.updateCleaning(cleaningEntity!);
    getData();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
