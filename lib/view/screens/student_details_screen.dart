import 'package:flutter/material.dart';
import 'package:student_dio_getx/model/student.dart';
import 'package:student_dio_getx/utils/constants/app_sizes.dart';
import 'package:student_dio_getx/utils/constants/app_strings.dart';
import 'package:student_dio_getx/utils/styles/app_text_style.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Student student;

  const StudentDetailsScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.studentDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(AppStrings.studentName, style: AppTexTStyle.txtBold14,),
                AppSizes.wGap20,
                Text(student.name, style: AppTexTStyle.txtSemiBold18,)
              ],
            ),
            Row(
              children: [
                 Text(AppStrings.studentAge, style: AppTexTStyle.txtBold14,),
                AppSizes.wGap20,
                Text(student.age, style: AppTexTStyle.txtSemiBold18,)
              ],
            ),
            Row(
              children: [
                 Text(AppStrings.studentMajor, style: AppTexTStyle.txtBold14,),
                AppSizes.wGap20,
                Text(student.major, style: AppTexTStyle.txtSemiBold18,),
              ],
            ),
            Row(
              children: [
                 Text(AppStrings.studentGpa, style: AppTexTStyle.txtBold14,),
                AppSizes.wGap20,
                Text(student.gpa, style: AppTexTStyle.txtSemiBold18,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
