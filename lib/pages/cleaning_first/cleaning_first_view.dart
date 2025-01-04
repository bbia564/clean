import 'package:cleaning_plan/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'cleaning_first_logic.dart';

class CleaningFirstPage extends GetView<CleaningFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cleaning plan')),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: <Widget>[
          Obx(() {
            return Text(
              '${controller.planCount.value} projects in total today',
              style: const TextStyle(fontWeight: FontWeight.bold),
            );
          }),
          Divider(
            height: 15,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Obx(() {
              return controller.list.value.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: <Widget>[
                        Image.asset(
                          'assets/noData.webp',
                          width: 49,
                          height: 53,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'No record',
                          style: TextStyle(color: Colors.grey),
                        )
                      ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.list.value.length,
                      itemBuilder: (_, index) {
                        final entity = controller.list.value[index];
                        return InkWell(
                          child: <Widget>[
                            <Widget>[
                              Image.asset(
                                'assets/icon${entity.type}.webp',
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(child: Text(titles[entity.type])),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                size: 25,
                                color: Colors.grey,
                              )
                            ].toRow(),
                            const Divider(
                              height: 25,
                              color: Color(0xffeaeaea),
                            )
                          ].toColumn(),
                          onTap: () {
                            Get.toNamed('/cleaningDetails', arguments: entity.type)?.then((_) {
                              controller.getData();
                            });
                          },
                        );
                      });
            }),
          )
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
      )
              .decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xffeaeaea)))
              .marginAll(15)),
    );
  }
}
