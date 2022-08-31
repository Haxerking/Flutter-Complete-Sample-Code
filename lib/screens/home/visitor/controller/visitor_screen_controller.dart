import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animations/stateless_animation/custom_animation.dart';

class VisitorScreenController extends GetxController {
  //for reactive approch please us Rx before any def
  late Rx<TextEditingController> otherController;

  late Rx<TextEditingController> nameController;
  late Rx<TextEditingController> emailController;
  late Rx<TextEditingController> addressController;
  RxBool colorChange = false.obs;
  late Rx<TextEditingController> phoneController;
  late Rx<TextEditingController> alternatePhoneController;
  late Rx<TextEditingController> orgTypeController;
  late CustomAnimationControl control;
  final formKey = GlobalKey<FormState>();
  RxBool loadingStatus = false.obs;
  RxBool isLoginSuccess = false.obs;
  RxBool others = false.obs;
  RxBool a = false.obs;
  RxBool b = false.obs;
  RxBool c = false.obs;
  RxBool d = false.obs;
  RxBool e = false.obs;

  @override
  void onInit() {
    super.onInit();
    changeStatusA(false);
    changeStatusB(false);
    changeStatusC(false);
    changeStatusD(false);
    changeStatusE(false);
    changeStatusO(false);

    nameController = TextEditingController().obs;
    otherController = TextEditingController().obs;
    emailController = TextEditingController().obs;
    addressController = TextEditingController().obs;
    phoneController = TextEditingController().obs;
    alternatePhoneController = TextEditingController().obs;
    orgTypeController = TextEditingController().obs;

    control = CustomAnimationControl.stop;
    a.value = false;
    b.value = false;
    c.value = false;
    d.value = false;
    e.value = false;
    others.value = false;
  }

  changeStatusA(value) {
    a.value = value;
  }

  changeStatusB(value) {
    b.value = value;
  }

  changeStatusC(value) {
    c.value = value;
  }

  changeStatusD(value) {
    d.value = value;
  }

  changeStatusE(value) {
    e.value = value;
  }

  changeStatusO(value) {
    others.value = value;
    log(others.value.toString());
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
      alternatePhoneController.value,
      addressController.value,
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
    addressController.value.text = "";
    emailController.value.text = "";
    phoneController.value.text = "";
    alternatePhoneController.value.text = "";
    orgTypeController.value.text = "";
    super.dispose();
  }

  void resetValues() {
    control = CustomAnimationControl.stop;
    loadingStatus.value = false;

    isLoginSuccess.value = false;
    otherController.value.text = "";

    isLoginSuccess.value = false;
  }
}
