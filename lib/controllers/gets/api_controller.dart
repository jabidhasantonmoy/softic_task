import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  var isLoading = false.obs;
  get getIsLoading => isLoading.value;

  var isSecure = true.obs;
  get getIsSecure => isSecure.value;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {}

  void changeLoading(value) {
    isLoading.value = value;
    update();
  }

  void changeVisibility() {
    isSecure.value = !isSecure.value;
    update();
  }

  //Login for Admin
}
