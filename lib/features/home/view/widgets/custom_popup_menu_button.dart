import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/features/home/controller/assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final String buttonType;
  final AssetsController assetsController;
  final int assetIndex;
  const CustomPopupMenuButton(
      {Key? key,
      required this.buttonType,
      required this.assetsController,
      this.assetIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Obx(() => Container(
            decoration: AppTheme.roundedContainerDecoration,
            padding: const EdgeInsets.all(15),
            child: PopupMenuButton(
                color: AppTheme.primaryColor,
                onSelected: (value) {
                  if (buttonType == "Location") {
                    assetsController.changeSelectedLocationValue(
                        value, assetIndex);
                  } else {
                    assetsController.changeSelectedAssetValue(
                        value, assetIndex);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      buttonType == "Location"
                          ? assetsController
                              .addNewAssetsRecordData[assetIndex]
                                  ['selectedLocation']
                              .value
                          : assetsController
                              .addNewAssetsRecordData[assetIndex]
                                  ['selectedAssetType']
                              .value,
                      style: AppTheme.subtitle1
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: AppTheme.primaryColor,
                    )
                  ],
                ),
                itemBuilder: (context) => buttonType == "Location"
                    ? assetsController.locationList
                    : assetsController.assetsList),
          )),
    );
  }
}
