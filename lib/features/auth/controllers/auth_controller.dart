import 'package:basic_mvc_architecture_setup/core/constants/app_pages.dart';
import 'package:basic_mvc_architecture_setup/core/error/failures.dart';
import 'package:basic_mvc_architecture_setup/core/network/network_info.dart';
import 'package:basic_mvc_architecture_setup/features/auth/data/auth_datasource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController loginEmailController = TextEditingController();
  NetworkInfo networkInfo = Get.find<NetworkInfo>();
  AuthDataSource authDataSource = Get.find<AuthDataSource>();

  String username = '';
  login(String username, String password) async {
    // if (!await networkInfo.isConnected) {
    //   handleError(const NetworkFailure("No Internet"));
    // }

    var response = await authDataSource.login(username, password);
    if (response is Failure) {
      handleError(response);
    } else {
      this.username = username;
      Get.toNamed(AppPages.homePage, arguments: this.username);
    }
  }

  //! Util functions -------------------------------------------------------------
  void handleError(Failure failure) {
    Get.snackbar("Error", failure.message,
        snackPosition: SnackPosition.TOP, colorText: Colors.white);
  }
}
