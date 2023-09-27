import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_dio_getx/controller/student_controller.dart';
import 'package:student_dio_getx/controller/text_field_controller.dart';
import 'package:student_dio_getx/utils/constants/app_sizes.dart';
import 'package:student_dio_getx/utils/constants/app_strings.dart';
import 'package:student_dio_getx/view/custom/custom_text_field.dart';

class AddStudentFormScreen extends StatelessWidget {
  final StudentController studentController = Get.find();
  final TextFieldController textFieldController =
      Get.put(TextFieldController());

  AddStudentFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addStudent),
      ),
      body: Column(
        children: [
          CustomTextField(
              controller: textFieldController.nameController,
              labelText: AppStrings.studentName),
          CustomTextField(
              controller: textFieldController.ageController,
              labelText: AppStrings.studentAge),
          CustomTextField(
              controller: textFieldController.majorController,
              labelText: AppStrings.studentMajor),
          CustomTextField(
              controller: textFieldController.gpaController,
              labelText: AppStrings.studentGpa),
          AppSizes.hGap20,
          Obx(() {
            return ElevatedButton(
                onPressed: textFieldController.isButtonEnabled.value
                    ? () {
                        createNewStudent();
                        textFieldController.nameController.clear();
                        textFieldController.ageController.clear();
                        textFieldController.majorController.clear();
                        textFieldController.gpaController.clear();
                      }
                    : null,
                child: Text(AppStrings.addStudent));
          })
        ],
      ),
    );
  }

  void createNewStudent() {
    final name = textFieldController.nameController.text;
    final age = textFieldController.ageController.text;
    final major = textFieldController.majorController.text;
    final gpa = textFieldController.gpaController.text;

    studentController.createStudent(
        name: name, age: age, major: major, gpa: gpa);
  }
}
