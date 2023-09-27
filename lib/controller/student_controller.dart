import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_dio_getx/api/api_services.dart';
import 'package:student_dio_getx/api/paths.dart';
import 'package:student_dio_getx/model/student.dart';

class StudentController extends GetxController {
  final ApiServices apiServices = ApiServices();
  final students = <Student>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudentData();
  }

  void fetchStudentData() async {
    try {
      final studentList = await apiServices.fetchStudents(studentEndpoint);
      students.assignAll(studentList);
    } catch (e) {
      print('Error fetching student data $e');
    }
  }

  Future<void> createStudent(
      {required String name,
      required String age,
      required String major,
      required String gpa}) async {
    try {
      final newStudent = await apiServices.createStudent(
          name: name, age: age, major: major, gpa: gpa);
      students.add(newStudent);
      Get.snackbar(
        'Success',
        'New student created: $name',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error creating student: $e');
    }
  }
}
