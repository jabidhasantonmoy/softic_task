import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../models/product_model.dart';
import '../../models/token_model.dart';
import '../../views/pages/home_page.dart';
import '../utils/static_strings.dart';

class ApiController extends GetxController {
  var isLoading = false.obs;
  get getIsLoading => isLoading.value;

  var isSecure = true.obs;
  get getIsSecure => isSecure.value;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late TokenModel tokenModel;
  RxList<ProductModel> productList = <ProductModel>[].obs;

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

  Future<void> login() async {
    try {
      changeLoading(true);

      final data = {
        "username": nameController.text,
        "password": passwordController.text,
        "rememberMe": true
      };
      final response = await dio.Dio().post(logInUrl,
          data: data,
          options: dio.Options(
            responseType: dio.ResponseType.plain,
          ));

      var value = json.decode(response.data.toString());

      if (response.statusCode == 200) {
        tokenModel = TokenModel.fromJson(value);

        print(tokenModel.idToken);

        changeLoading(false);
        Get.snackbar("Success", "Login Successful");
        getProducts();
        Get.off(() => const HomePage());
      } else {
        changeLoading(false);
        Get.defaultDialog(
          title: "Error Message",
          content: const Text("Error has occured. Try again."),
        );
      }
    } catch (e) {
      changeLoading(false);
      Get.snackbar("Error", e.toString());
      print("Print Error $e");
    }
  }

  Future<void> getProducts() async {
    try {
      var response = await dio.Dio().get(
        productsUrl,
        options: dio.Options(
          headers: {
            "Authorization": "Bearer ${tokenModel.idToken}",
          },
          responseType: dio.ResponseType.plain,
        ),
      );
      var value = jsonDecode(response.data.toString());

      if (response.statusCode == 200) {
        for (var p in value) {
          productList.add(ProductModel.fromJson(p));
        }
        productList.refresh();

        changeLoading(false);
        Get.off(() => const HomePage());
      } else {
        changeLoading(false);
        Get.defaultDialog(
          title: "Error Message",
          content: const Text("Error has occurred. Try again."),
        );
      }
    } catch (error) {
      print("Print Error $error");
    }
  }
}
