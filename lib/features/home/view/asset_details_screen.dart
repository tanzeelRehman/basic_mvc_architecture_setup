// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_mvc_architecture_setup/core/widgets/primary_continuebutton.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/widgets/add_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:basic_mvc_architecture_setup/features/home/controller/assets_controller.dart';
import 'package:basic_mvc_architecture_setup/features/home/controller/employee_list_controller.dart';
import 'package:basic_mvc_architecture_setup/features/home/model/get_assigned_assets.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/widgets/asset_detail_tile.dart';
import 'package:logger/logger.dart';

import '../../../core/helper/getPreferedSizeAppbar.dart';
import '../../../core/theme/app_theme.dart';

class AssetDetailScreen extends StatefulWidget {
  String assetType;
  AssetDetailScreen({
    Key? key,
    required this.assetType,
  }) : super(key: key);

  @override
  State<AssetDetailScreen> createState() => _AssetDetailScreenState();
}

class _AssetDetailScreenState extends State<AssetDetailScreen> {
  AssetsController assetsController = Get.find<AssetsController>();
  EmployeeListController employeeListController =
      Get.find<EmployeeListController>();

  List<Assets>? assetsData = [];
  @override
  void initState() {
    if (widget.assetType == "Laptop") {
      assetsData = employeeListController.laptopList ?? [];
    } else if (widget.assetType == "Mobile") {
      assetsData = employeeListController.mobileList ?? [];
    } else {
      assetsData = employeeListController.internetDevicesList ?? [];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppTheme.scaffoldBackgroundColor,
          appBar: getPreferedSizeAppbar('Asset Details'),
          body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: assetsData!.length,
                      itemBuilder: (context, index) {
                        if (assetsData!.isEmpty) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "No Asset assigned",
                                style: AppTheme.heading1,
                              )
                            ],
                          );
                        } else {
                          return AssetDetailTile(
                            ondelete: () {
                              employeeListController.deleteAssignedAssets(
                                  assetsData![index].asset_id);
                            },
                            assetId: assetsData![index].asset_id,
                            assignedLocation: assetsData![index].location,
                            assignedDate: assetsData![index].assignDate,
                            name: assetsData![index].assetsType,
                            model: assetsData![index].assetName ?? '-',
                            active: assetsData![index].status,
                          );
                        }
                      },
                    ),
                    GetBuilder<AssetsController>(
                      builder: (controller) {
                        return Column(
                          children: [
                            for (int i = 0;
                                i <=
                                    assetsController
                                            .addNewAssetsRecordData.length -
                                        1;
                                i++)
                              AddAssetWidget(
                                assetsController: assetsController,
                                assetIndex: i,
                              ),
                            GestureDetector(
                              onTap: () {
                                Logger().i(assetsController
                                    .addAssetsWidgetList.length);
                                assetsController.addNewWidgetToList(
                                    AddAssetWidget(
                                        assetsController: assetsController));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.primaryColor),
                                    borderRadius: BorderRadius.circular(20.r)),
                                padding: EdgeInsets.all(10.sp),
                                child: Text("Add new asset",
                                    style: TextStyle(
                                        color: AppTheme.primaryColor)),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            assetsController.addNewAssetsRecordData.isNotEmpty
                                ? PrimaryContinueButton(
                                    text: "Save",
                                    ontap: () {
                                      assetsController.saveNewAssetsListData();
                                    })
                                : const SizedBox.shrink()
                          ],
                        );
                      },
                    ),
                  ],
                )),
          )),
    );
  }
}
