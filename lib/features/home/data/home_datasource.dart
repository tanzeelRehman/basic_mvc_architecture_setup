import 'dart:convert';

import 'package:basic_mvc_architecture_setup/core/constants/app_url.dart';
import 'package:basic_mvc_architecture_setup/core/error/failures.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_all_employees.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_assigned_assets.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_assigned_employees.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_unassigned_employees.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:logger/logger.dart';

class HomeDataSource {
  //! Instenses
  Dio dio = Get.find<Dio>();

  //* API CALLS ------------------------------------------------------------------->

  //- GET EMPLOYEES
  Future<dynamic> getAllEmployees() async {
    String url = AppUrl.baseUrl + AppUrl.getAllEmployees;
    Logger().i("get All employees url $url");
    try {
      final response = await dio.get(url);
      Logger().i(response.statusCode);
      if (response.statusCode == 200) {
        var object = GetAllEmployeesResponseModel.fromJson(response.data);
        return object;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //- GET UN ASSIGNED EMPLOYEES
  Future<dynamic> getUnAssignedEmployees() async {
    String url = AppUrl.baseUrl + AppUrl.getUnassignedEmployees;

    Logger().i("get Un assigned employees url $url");

    try {
      final response = await dio.get(url);
      Logger().i(response.statusCode);
      if (response.statusCode == 200) {
        var object =
            GetUnAssignedEmployeesResponseModel.fromJson(response.data);
        return object;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //- ASSIGN ASSETS TO EMPLOYEES
  Future<dynamic> assignAssets(String assetId, int userId, String assetName,
      String assetType, String assetLocation) async {
    String url = AppUrl.baseUrl + AppUrl.assignAssets;

    var assetdata = {
      "asset_id": assetId.trim(),
      "user_id": userId,
      "asset_name": assetName.trim(),
      "assets_type": assetType.trim(),
      "assign_date": DateTime.now().toIso8601String(),
      "status": 1,
      "location": assetLocation.trim()
    };
    Logger().i("Assign Asset url $url");
    Logger().i(assetdata);
    try {
      final response = await dio.post(url, data: assetdata);
      Logger().i(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      }
      return const Failure('Something went wrong');
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //- GET  ASSIGNED EMPLOYEES
  Future<dynamic> getAssignedEmployees() async {
    String url = AppUrl.baseUrl + AppUrl.getAssignedEmployees;

    Logger().i("get assigned employees url $url");

    try {
      final response = await dio.get(url);
      Logger().i(response.statusCode);
      if (response.statusCode == 200) {
        var object = GetAssignedEmployees.fromJson(response.data);
        return object;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //- GET  ASSIGNED EMPLOYEES
  Future<dynamic> getSingleAssignedAssets(String id) async {
    String url = AppUrl.baseUrl + AppUrl.getSingleAssignedAssets + id;

    Logger().i("get assigned assets url $url");

    try {
      final response = await dio.get(url);
      Logger().i(response.statusCode);
      Logger().i(response.data);

      if (response.statusCode == 200) {
        var object = GetAssignedAssets.fromJson(response.data);
        return object;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //- Delete  ASSIGNED Assets
  Future<dynamic> deleteAssignedAssets(String assetID) async {
    String url = AppUrl.baseUrl + AppUrl.deleteAssignedAssets + assetID;

    Logger().i("deleting assigned asset url $url");

    try {
      final response = await dio.delete(url);

      Logger().i(response.statusCode);
      Logger().i(response.data);
      // var data = jsonDecode(response.data);
      // print(response.statusCode);
      // print(data);

      if (response.statusCode == 200) {
        return true;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      print(e.toString());
      return Failure(e.toString());
    }
  }
}
