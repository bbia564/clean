import 'package:cleaning_plan/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'cleaning_details_logic.dart';

class CleaningDetailsPage extends GetView<CleaningDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[controller.type]),
        actions: [
          const Icon(
            Icons.add,
            size: 25,
            color: Colors.black,
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.addData();
          })
        ],
      ),
      body: SafeArea(
          child: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(15),
          child: GetBuilder<CleaningDetailsLogic>(builder: (_) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Something to tidy up',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                ),
                (controller.cleaningEntity?.list.isEmpty == true || controller.cleaningEntity == null)
                    ? const Center(
                        child: Text('No data'),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: controller.cleaningEntity?.list.length ?? 0,
                        itemBuilder: (_, index) {
                          final entity = controller.cleaningEntity?.list[index];
                          return InkWell(
                            child: <Widget>[
                              <Widget>[
                                Image.asset(
                                  'assets/${entity?.hadDone == 0 ? 'unselect' : 'selected'}.webp',
                                  width: 16,
                                  height: 16,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text(
                                  entity?.title ?? '',
                                  style: TextStyle(
                                    color: entity?.hadDone == 0 ? Colors.black : Colors.black45,
                                    decoration: entity?.hadDone == 0 ? null : TextDecoration.lineThrough,
                                      decorationStyle: entity?.hadDone == 0
                                          ? null
                                          : TextDecorationStyle.solid),
                                ))
                              ].toRow(),
                              Divider(
                                height: 25,
                                color: Colors.grey[300],
                              )
                            ].toColumn(),
                            onTap: () {
                              controller.updateStatus(entity!);
                            },
                          );
                        })
              ].toColumn(),
            );
          }),
        )
            .decorated(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xffe5e5e5)))
            .marginOnly(left: 15, right: 15, top: 15, bottom: 15),
        Image.asset(
          'assets/icon${controller.type}.webp',
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        )
      ].toStack(alignment: Alignment.topCenter)),
    );
  }
}
