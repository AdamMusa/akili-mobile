// ignore_for_file: unnecessary_overrides
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  TextEditingController username = TextEditingController(text: '');
  TextEditingController name = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController passwordConfirm = TextEditingController(text: '');
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    passwordConfirm.dispose();
    email.dispose();
    name.dispose();
    super.onClose();
  }
}
