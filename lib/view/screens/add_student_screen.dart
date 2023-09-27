import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_dio_getx/controller/student_controller.dart';
import 'package:student_dio_getx/utils/constants/app_sizes.dart';
import 'package:student_dio_getx/utils/constants/app_strings.dart';

// ignore: must_be_immutable
class AddStudentScreen extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController gpaController = TextEditingController();

  AddStudentScreen({super.key});

  void _createNewStudent() {
    final name = nameController.text;
    final age = ageController.text;
    final major = majorController.text;
    final gpa = gpaController.text;

    studentController.createStudent(
      name: name,
      age: age,
      major: major,
      gpa: gpa,
    );

    nameController.clear();
    ageController.clear();
    majorController.clear();
    gpaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.studentManagement),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: AppStrings.studentName),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: AppStrings.studentAge),
              ),
              TextField(
                controller: majorController,
                decoration: InputDecoration(labelText: AppStrings.studentMajor),
              ),
              TextField(
                controller: gpaController,
                decoration: InputDecoration(labelText: AppStrings.studentGpa),
              ),
              AppSizes.hGap20,
              ElevatedButton(
                onPressed: _createNewStudent,
                child: Text(AppStrings.addStudent),
              ),
            ],
          ),
        ));
  }
}
