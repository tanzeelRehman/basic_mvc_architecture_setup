// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_mvc_architecture_setup/features/home/controller/employee_list_controller.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/asset_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:basic_mvc_architecture_setup/core/helper/getPreferedSizeAppbar.dart';
import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/widgets/edit_seatNo_bottomsheet.dart';

class EmployeeProfileScreen extends StatefulWidget {
  String name;
  String seatNo;
  EmployeeProfileScreen({
    Key? key,
    required this.name,
    required this.seatNo,
  }) : super(key: key);

  @override
  State<EmployeeProfileScreen> createState() => _EmployeeProfileScreenState();
}

class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
  EmployeeListController employeeListController =
      Get.find<EmployeeListController>();
  // AssetsController assetsController = Get.find<AssetsController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        appBar: getPreferedSizeAppbar('Profile Screen'),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              employeeSeatNoWidget(widget.name, widget.seatNo),
              GetBuilder<EmployeeListController>(
                builder: (controller) {
                  return Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        assetIcon("Laptop",
                            employeeListController.laptopCount.toString(),
                            () async {
                          await Get.to(
                              () => AssetDetailScreen(assetType: "Laptop"));
                          await employeeListController.getAssignAssets(
                              employeeListController.selectedEmployeeID
                                  .toString());
                        }),
                        assetIcon("Mobile",
                            employeeListController.mobileCount.toString(),
                            () async {
                          await Get.to(AssetDetailScreen(assetType: "Mobile"));
                          await employeeListController.getAssignAssets(
                              employeeListController.selectedEmployeeID
                                  .toString());
                        }),
                        assetIcon(
                            "Internet Device",
                            employeeListController.internetDeviceCount
                                .toString(), () async {
                          await Get.to(
                              AssetDetailScreen(assetType: "Internet Device"));
                          await employeeListController.getAssignAssets(
                              employeeListController.selectedEmployeeID
                                  .toString());
                        }),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget assetIcon(String assetName, String count, Function() ontap) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.2.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: 80.h,
              width: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(50.r)),
              child: Text(
                count,
                style: AppTheme.heading1.copyWith(fontSize: 25.sp),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            assetName,
            style: AppTheme.subtitle1,
          )
        ],
      ),
    );
  }

  //-  CUSTOM SCREEN WIDGETS --------------------------------------------------------------------

  Container employeeSeatNoWidget(String name, String seatNo) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(2, 3))
          ],
          borderRadius: BorderRadius.circular(15.r),
          color: AppTheme.canvasColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTheme.heading1,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Sitting on seat No. $seatNo",
                style: AppTheme.subtitle1
                    .copyWith(fontSize: 15, color: AppTheme.primaryColor),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.bottomSheet(EditSeatNoBottomSheet(employeeName: name));
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: Icon(
                Icons.edit,
                size: 19,
                color: AppTheme.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
