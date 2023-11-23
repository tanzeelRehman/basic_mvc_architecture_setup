import 'package:basic_mvc_architecture_setup/core/error/failures.dart';
import 'package:basic_mvc_architecture_setup/core/network/network_info.dart';
import 'package:basic_mvc_architecture_setup/features/home/data/home_datasource.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_all_employees.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_assigned_assets.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_assigned_employees.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_unassigned_employees.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../core/constants/app_pages.dart';

class EmployeeListController extends GetxController {
  //! External variables
  NetworkInfo networkInfo = Get.find<NetworkInfo>();
  HomeDataSource homeDataSource = Get.find<HomeDataSource>();

  //! Model variables
  late GetAllEmployeesResponseModel getAllEmployeesResponseModel;
  late GetUnAssignedEmployeesResponseModel getUnAssignedEmployeesResponseModel;
  late GetAssignedEmployees getAssignedEmployeesResponseModel;
  late GetAssignedAssets getAssignedAssets;

  //! Class variables
  var unAssignEmployeeFilteredList = <UnassignedEmployeeResult>[].obs;
  String selectedEmployeeName = '';
  int selectedEmployeeID = 0;
  bool fetchingData = false;

  // assets
  int laptopCount = 0;
  int mobileCount = 0;
  int internetDeviceCount = 0;

  List<Assets>? laptopList;
  List<Assets>? mobileList;
  List<Assets>? internetDevicesList;

  //* API CALLS --------------------------------------------------------------------------->
  //- GET ALL EMPLOYEES
  Future<void> getAllEmployees() async {
    var response = await homeDataSource.getAllEmployees();
    if (response is Failure) {
      handleError(response);
    } else {
      getAllEmployeesResponseModel = response;
      Logger().i(getAllEmployeesResponseModel.toJson());
    }
  }

  //- GET UN ASSIGNED EMPLOYEES
  Future<void> getUnAssignedEmployees() async {
    var response = await homeDataSource.getUnAssignedEmployees();
    if (response is Failure) {
      handleError(response);
    } else {
      getUnAssignedEmployeesResponseModel = response;
      // Logger().i(getUnAssignedEmployeesResponseModel.toJson());
      unAssignEmployeeFilteredList.value =
          getUnAssignedEmployeesResponseModel.unassignedEmployeeResult;
    }
  }

  //- GET ASSIGNED EMPLOYEES
  Future<void> getAssignedEmployees() async {
    var response = await homeDataSource.getAssignedEmployees();
    if (response is Failure) {
      handleError(response);
    } else {
      getAssignedEmployeesResponseModel = response;
      //Logger().i(getAssignedEmployeesResponseModel.toJson());
    }
  }

  //- GET ASSIGNED EMPLOYEES
  // Future<void> deleteAssignedAssets(String assetID) async {
  //   var response = await homeDataSource.deleteAssignedAssets(assetID);
  //   if (response == 200) {
  //     handleSuccess("Asset deleted");
  //     print("yessssssssssssssssssssssssss");
  //   } else {
  //     handleError(const Failure("Unable to delete asset"));
  //   }
  //   update();
  // }

  //-DELETE ASSIGN ASSETS

  //- ASSIGN ASSETS TO EMPLOYEES
  Future<void> assignAssetToEmployees(String assetId, String assetName,
      String assetType, String assetLocation) async {
    var response = await homeDataSource.assignAssets(
        assetId, selectedEmployeeID, assetName, assetType, assetLocation);
    if (response is Failure) {
      handleError(response);
    } else {
      handleSuccess("Asset Assigned to $selectedEmployeeName");
    }
  }

  //- ASSIGN ASSETS TO EMPLOYEES
  Future<void> assignAssetToEmployee(String assetId, String assetName,
      String assetType, String assetLocation) async {
    var response = await homeDataSource.assignAssets(
        assetId, selectedEmployeeID, assetName, assetType, assetLocation);
    if (response is Failure) {
      handleError(response);
    } else {
      handleSuccess("Asset Assigned to $selectedEmployeeName");
    }
  }

  //DELETE ASSETS TO EMPLOYEES
  // Future<void> deleteAssignedAssets(String assetID) async {
  //   try {
  //     var response = await homeDataSource.deleteAssignedAssets(assetID);
  //
  //     if (response) {
  //       handleSuccess("Asset deleted");
  //       print(laptopList?.length);
  //       print (mobileList?.length);
  //
  //       laptopList?.removeWhere((element) => element.asset_id==assetID);
  //       mobileList?.removeWhere((element) => element.asset_id==assetID);
  //       print(laptopList?.length);
  //       print (mobileList?.length);
  //       print("Asset deleted successfully");
  //       Get.toNamed(AppPages.employeeProfilePage);
  //     } else {
  //       handleError(const Failure("Unable to delete asset"));
  //     }
  //
  //     update();
  //
  //   } catch (e) {
  //     handleError(Failure(e.toString()));
  //   }
  // }

  // DELETE ASSIGN ASSETS
  Future<void> deleteAssignedAssets(String assetID) async {
    try {
      var response = await homeDataSource.deleteAssignedAssets(assetID);

      if (response) {
        handleSuccess("Asset deleted");
        print(laptopList?.length);
        print(mobileList?.length);

        laptopList?.removeWhere((element) => element.asset_id == assetID);
        mobileList?.removeWhere((element) => element.asset_id == assetID);
        print(laptopList?.length);
        print(mobileList?.length);
        print("Asset deleted successfully");

        // Update the UI
        update();

        // Navigate to the employee profile page or adjust navigation as needed
        print("hi");
        // Get.toNamed(AppPages.employeeAssetDetailsPage);
        print("hello");
      } else {
        handleError(const Failure("Unable to delete asset"));
      }
    } catch (e) {
      handleError(Failure(e.toString()));
    }
  }

  //- ASSIGN ASSETS TO EMPLOYEES
  Future<void> getAssignAssets(String id) async {
    var response = await homeDataSource.getSingleAssignedAssets(id);
    if (response is Failure) {
      handleError(response);
    } else {
      getAssignedAssets = response;
      laptopList = getAssignedAssets.assets
          .where(
            (asset) => asset.assetsType == "Laptop",
          )
          .toList();
      mobileList = getAssignedAssets.assets
          .where(
            (asset) => asset.assetsType == "Mobile",
          )
          .toList();
      internetDevicesList = getAssignedAssets.assets
          .where(
            (asset) => asset.assetsType == "Internet Device",
          )
          .toList();
      laptopCount = laptopList == null ? 0 : laptopList!.length;
      mobileCount = mobileList == null ? 0 : mobileList!.length;
      internetDeviceCount =
          internetDevicesList == null ? 0 : internetDevicesList!.length;
      // Logger().e(getAssignedAssets.assets[1].assetName);
      update();
    }
  }

  //* Business Logic ---------------------------------------------------------->
  void filterUnAssignContactList(String? query) {
    unAssignEmployeeFilteredList.value = [];
    if (query != null) {
      unAssignEmployeeFilteredList.value = getUnAssignedEmployeesResponseModel
          .unassignedEmployeeResult
          .where((employee) => employee.firstName.contains(query))
          .toList();
    }
  }

  void selectEmployeeName(String employeename, int userId) {
    selectedEmployeeName = employeename;
    selectedEmployeeID = userId;
    update();
  }

  // This loader will be used for fetching all assigned and unassigned employees data
  void toggleFetchingEmployeeDataLoader() {
    fetchingData = !fetchingData;
    update();
  }

  //* Util functions ------------------------------------------------------------>
  void handleError(Failure failure) {
    Get.snackbar(
      "Error",
      failure.message,
      snackPosition: SnackPosition.TOP,
    );
  }

  void handleSuccess(String sucess) {
    Get.snackbar(
      "Success",
      sucess,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}
