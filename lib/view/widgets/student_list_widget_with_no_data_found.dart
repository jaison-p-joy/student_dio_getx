import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_dio_getx/controller/student_controller.dart';

// ignore: must_be_immutable
class StudentListWithNoDataFound extends StatefulWidget {
  StudentController studentController = Get.put(StudentController());
  StudentListWithNoDataFound({super.key});

  @override
  State<StudentListWithNoDataFound> createState() =>
      _StudentListWithNoDataFoundState();
}

class _StudentListWithNoDataFoundState
    extends State<StudentListWithNoDataFound> {
  final isLoading = true.obs;
  final hasData = false.obs;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      hasData.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
