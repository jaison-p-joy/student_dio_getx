import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_dio_getx/utils/constants/app_color.dart';
import 'package:student_dio_getx/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.appColorScheme),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

