import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final majorController = TextEditingController();
  final gpaController = TextEditingController();
  final isButtonEnabled = false.obs;

  @override
  void onInit() {
    nameController.addListener(updateButtonState);
    ageController.addListener(updateButtonState);
    majorController.addListener(updateButtonState);
    gpaController.addListener(updateButtonState);
    super.onInit();
  }

  void updateButtonState() {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        majorController.text.isEmpty ||
        gpaController.text.isEmpty) {
      isButtonEnabled.value = false;
    } else {
      isButtonEnabled.value = true;
    }
  }

}
