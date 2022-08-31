import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animations/stateless_animation/custom_animation.dart';

import '../../../../app_globel_data.dart';

class HostScreenController extends GetxController {
  //for reactive approch please us Rx before any def
  late Rx<TextEditingController> searchController;
  late Rx<TextEditingController> nameController;
  late Rx<TextEditingController> emailController;
  late Rx<TextEditingController> durationController;
  RxBool colorChange = false.obs;
  late Rx<TextEditingController> phoneController;
  late Rx<TextEditingController> meetingStartTimeController;
  late Rx<TextEditingController> orgTypeController;
  late CustomAnimationControl control;
  final formKey = GlobalKey<FormState>();

  RxBool loadingStatus = false.obs;
  RxBool isLoginSuccess = false.obs;

  @override
  void onInit() {
    super.onInit();
    dropDown("");
    nameController = TextEditingController().obs;
    searchController = TextEditingController().obs;
    emailController = TextEditingController().obs;
    durationController = TextEditingController().obs;
    phoneController = TextEditingController().obs;
    meetingStartTimeController = TextEditingController().obs;
    orgTypeController = TextEditingController().obs;

    control = CustomAnimationControl.stop;
  }

  changeLoadingStatus(bool value) {
    loadingStatus.value = value;
  }

  changeButtonLoadingStatus(bool value) {
    control = value == true
        ? CustomAnimationControl.play
        : CustomAnimationControl.playReverse;
  }

  controllerList() {
    final listData = [
      nameController.value,
      emailController.value,
      phoneController.value,
      durationController.value,
      meetingStartTimeController.value,
      orgTypeController.value
    ];
    return listData;
  }

  @override
  void onClose() {
    // TODO: implement onClose

    resetValues();
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.value.text = "";
    durationController.value.text = "";
    emailController.value.text = "";
    phoneController.value.text = "";
    meetingStartTimeController.value.text = "";
    orgTypeController.value.text = "";
    super.dispose();
  }

  void resetValues() {
    control = CustomAnimationControl.stop;
    loadingStatus.value = false;

    isLoginSuccess.value = false;
    searchController.value.text = "";

    isLoginSuccess.value = false;
  }

  dropDown(newValue) {
    return GlobelData().hostselectedduration.value = newValue!;
  }
}
