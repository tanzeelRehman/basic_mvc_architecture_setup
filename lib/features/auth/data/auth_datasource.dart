import 'dart:async';

import 'package:basic_mvc_architecture_setup/core/constants/app_url.dart';
import 'package:basic_mvc_architecture_setup/core/error/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

class AuthDataSource {
  Dio dio = Get.find<Dio>();

  Future<dynamic> login(String email, String password) async {
    String url = AppUrl.baseUrl + AppUrl.login;
    var credientials = {
      'username': email.trim(),
      'password': password.trim(),
    };

    try {
      final response = await dio.post(url, data: credientials);
      Logger().i(response.statusCode);

      if (response.statusCode == 200) {
        return response.data;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      Logger().i(e);
      return Failure(e.toString());
    }
  }
}
