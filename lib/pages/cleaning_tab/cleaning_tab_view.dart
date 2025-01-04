import 'package:cleaning_plan/pages/cleaning_add/cleaning_add_view.dart';
import 'package:cleaning_plan/pages/cleaning_first/cleaning_first_view.dart';
import 'package:cleaning_plan/pages/cleaning_second/cleaning_second_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../cleaning_first/cleaning_first_logic.dart';
import 'cleaning_tab_logic.dart';

class CleaningTabPage extends GetView<CleaningTabLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          CleaningFirstPage(),
          CleaningAddPage(),
          CleaningSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(() => _navCleanBars()),
    );
  }

  Widget _navCleanBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item0Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item0Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: primaryColor,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item1Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item1Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Set',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/cleaningAdd')?.then((_) {
            CleaningFirstLogic firstLogic = Get.find<CleaningFirstLogic>();
            firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
