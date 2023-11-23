import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/features/home/controller/employee_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AssetsController extends GetxController {
  EmployeeListController employeeListController =
      Get.find<EmployeeListController>();

  //* Widget State variables
  List<Map> addNewAssetsRecordData = [];

  //* Widget List
  var addAssetsWidgetList = <Widget>[];

  //! Business logic
  void changeSelectedAssetValue(String assetType, int assetIndex) {
    addNewAssetsRecordData[assetIndex]['selectedAssetType'].value = assetType;
  }

  void changeSelectedLocationValue(String location, int assetIndex) {
    addNewAssetsRecordData[assetIndex]['selectedLocation'].value = location;
  }

  void addNewWidgetToList(Widget addAssetWidget) {
    addAssetsWidgetList.add(addAssetWidget);
    addNewAssetsRecordData.add({
      'assetNameCon': TextEditingController(),
      'modelCont': TextEditingController(),
      'selectedAssetType': 'Asset Type'.obs,
      'selectedLocation': 'Location'.obs
    });

    update();
  }

  void saveNewAssetsListData() {
    var toRemove = [];
    bool showError = false;
    for (var asset in addNewAssetsRecordData) {
      if (asset['assetNameCon'].text == '' ||
          asset['modelCont'].text == '' ||
          asset['selectedAssetType'].value == 'Asset Type' ||
          asset['selectedLocation'] == 'Location') {
        showError = true;
      } else {
        employeeListController.assignAssetToEmployees(
            asset['modelCont'].text,
            asset['assetNameCon'].text,
            asset['selectedAssetType'].value,
            asset['selectedLocation'].value);
        Logger().i(asset['assetNameCon'].text);
        Logger().i(asset['modelCont'].text);
        Logger().i(asset['selectedAssetType']);
        Logger().i(asset['selectedLocation']);
        toRemove.add(asset);
      }
    }

    for (var asset in toRemove) {
      // Logger().i(index);
      addAssetsWidgetList.remove(asset);
      addNewAssetsRecordData.remove(asset);
      update();
    }

    if (showError) {
      handleError("Following Asset info is not complete");
    }
  }

  void handleError(String failure) {
    Get.snackbar(
      "Error",
      failure,
      colorText: Colors.white,
      borderColor: Colors.red,
      borderWidth: 1,
      snackPosition: SnackPosition.TOP,
    );
  }

  void handleSuccess(String failure) {
    Get.snackbar(
      "Success",
      failure,
      colorText: Colors.white,
      borderColor: Colors.green,
      borderWidth: 1,
      snackPosition: SnackPosition.TOP,
    );
  }

  //- CONSTANT DATA --------------------------------------------------------------------------------->

  List<PopupMenuItem<String>> assetsList = [
    PopupMenuItem(
      value: 'Laptop',
      child: Text(
        "Laptop",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
    PopupMenuItem(
      value: 'Mobile',
      child: Text(
        "Mobile",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
    PopupMenuItem(
      value: 'Internet Device',
      child: Text(
        "Internet Device",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
  ];
  List<PopupMenuItem<String>> locationList = [
    PopupMenuItem(
      value: 'Islamabad',
      child: Text(
        "Islamabad",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
    PopupMenuItem(
      value: 'lahore',
      child: Text(
        "Lahore",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
    PopupMenuItem(
      value: 'Karachi',
      child: Text(
        "Karachi",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
  ];
}
