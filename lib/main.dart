import 'package:cleaning_plan/db_cleaning/db_cleaning.dart';
import 'package:cleaning_plan/pages/cleaning_add/cleaning_add_binding.dart';
import 'package:cleaning_plan/pages/cleaning_add/cleaning_add_view.dart';
import 'package:cleaning_plan/pages/cleaning_details/cleaning_details_binding.dart';
import 'package:cleaning_plan/pages/cleaning_details/cleaning_details_view.dart';
import 'package:cleaning_plan/pages/cleaning_first/cleaning_first_binding.dart';
import 'package:cleaning_plan/pages/cleaning_first/cleaning_first_view.dart';
import 'package:cleaning_plan/pages/cleaning_second/cleaning_second_binding.dart';
import 'package:cleaning_plan/pages/cleaning_second/cleaning_second_view.dart';
import 'package:cleaning_plan/pages/cleaning_tab/cleaning_tab_binding.dart';
import 'package:cleaning_plan/pages/cleaning_tab/cleaning_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff22bc22);
Color bgColor = const Color(0xfffcfcfc);
List<String> titles = [
  'Living Room',
  '''Children's room''',
  'Dining Room',
  'Garage',
  'Garden',
  'Balcony',
  'Master Bedroom',
  'Corridor'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBCleaning().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Cleans,
      initialRoute: '/cleaningTab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Cleans = [
  GetPage(name: '/cleaningTab', page: () => CleaningTabPage(), binding: CleaningTabBinding()),
  GetPage(name: '/cleaningFirst', page: () => CleaningFirstPage(), binding: CleaningFirstBinding()),
  GetPage(name: '/cleaningSecond', page: () => CleaningSecondPage(), binding: CleaningSecondBinding()),
  GetPage(name: '/cleaningDetails', page: () => CleaningDetailsPage(), binding: CleaningDetailsBinding()),
  GetPage(name: '/cleaningAdd', page: () => CleaningAddPage(), binding: CleaningAddBinding()),
];