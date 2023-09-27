import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_dio_getx/controller/student_controller.dart';
import 'package:student_dio_getx/utils/constants/app_icons.dart';
import 'package:student_dio_getx/utils/constants/app_strings.dart';
import 'package:student_dio_getx/utils/styles/app_text_style.dart';
import 'package:student_dio_getx/view/screens/add_student_form_screen.dart';
import 'package:student_dio_getx/view/widgets/student_list_widget.dart';

class HomeScreen extends StatelessWidget {
  final StudentController studentController = StudentController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              AppStrings.allStudents,
              style: AppTexTStyle.txtBold24,
            ),
            Expanded(child: StudentListWidget()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(AddStudentFormScreen());
      }, child: AppIcons.addStudentIcon,),
    );
  }
}
