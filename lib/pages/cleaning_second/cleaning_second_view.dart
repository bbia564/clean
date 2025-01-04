import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'cleaning_second_logic.dart';

class CleaningSecondPage extends GetView<CleaningSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all records', 'About us'];
    return Container(
      color: Colors.transparent,
      height: 40,
      alignment: Alignment.centerLeft,
      child: <Widget>[
        Text(
          titles[index],
          textAlign: TextAlign.left,
        ),
        index == 0 ? const Text('') : const Text('1.0.0')
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanCleaningData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                _item(0, context),
                _item(1, context),
              ].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12),border: Border.all(color: const Color(0xffeaeaea)))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
