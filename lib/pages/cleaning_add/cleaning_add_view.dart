import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'cleaning_add_logic.dart';

class CleaningAddPage extends GetView<CleaningAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Room'),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
            padding:const EdgeInsets.all(15),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: titles.length,
                itemBuilder: (_, index) {
                  final entity = titles[index];
                  return InkWell(
                    child: <Widget>[
                      <Widget>[
                        Image.asset(
                          'assets/icon$index.webp',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Text(titles[index])),
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
                      Get.toNamed('/cleaningDetails',arguments: index);
                    },
                  );
                }),
      ).decorated(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xffeaeaea))).marginAll(15)),
    );
  }
}
