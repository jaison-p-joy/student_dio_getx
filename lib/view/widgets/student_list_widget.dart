import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_dio_getx/controller/student_controller.dart';
import 'package:student_dio_getx/utils/constants/app_icons.dart';
import 'package:student_dio_getx/utils/styles/app_text_style.dart';
import 'package:student_dio_getx/view/screens/student_details_screen.dart';

// ignore: must_be_immutable
class StudentListWidget extends StatelessWidget {
  StudentController studentController = Get.put(StudentController());
  StudentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (studentController.students.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.separated(
          itemBuilder: (context, index) {
            final student = studentController.students[index];
            return ListTile(
              title: Text(
                student.name,
                style: AppTexTStyle.txtBold24,
              ),
              subtitle: Text(student.major, style: AppTexTStyle.txtSemiBold18),
              trailing: AppIcons.nextIcon,
              onTap: () {
                Get.to(StudentDetailsScreen(student: student));
              },
            );
          },
          itemCount: studentController.students.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      }
    });
  }
}
