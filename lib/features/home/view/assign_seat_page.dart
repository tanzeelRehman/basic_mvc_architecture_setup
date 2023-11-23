import 'package:basic_mvc_architecture_setup/core/helper/getPreferedSizeAppbar.dart';
import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/core/widgets/custom_text_formfield.dart';
import 'package:basic_mvc_architecture_setup/core/widgets/primary_continuebutton.dart';
import 'package:basic_mvc_architecture_setup/features/home/controller/employee_list_controller.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/widgets/select_employee_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AssignSeatPage extends StatefulWidget {
  const AssignSeatPage({super.key});

  @override
  State<AssignSeatPage> createState() => _AssignSeatPageState();
}

class _AssignSeatPageState extends State<AssignSeatPage> {
  TextEditingController searchPersonController = TextEditingController();
  TextEditingController selectSeatController = TextEditingController();
  EmployeeListController employeeListController =
      Get.find<EmployeeListController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getPreferedSizeAppbar(
          "Assign Seat",
          onBack: () async {
            Logger().e("Calling");
            employeeListController.toggleFetchingEmployeeDataLoader();
            await employeeListController.getUnAssignedEmployees();
            await employeeListController.getAssignedEmployees();
            employeeListController.toggleFetchingEmployeeDataLoader();
          },
        ),
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                GetBuilder<EmployeeListController>(
                  builder: (controller) {
                    return CustomTextFormField(
                      height: 55.h,
                      width: double.infinity,
                      contentPadding: EdgeInsets.only(
                          left: 15.sp, right: 30.sp, top: 15.sp, bottom: 15.sp),
                      hintText:
                          employeeListController.selectedEmployeeName == ''
                              ? "Select employee"
                              : employeeListController.selectedEmployeeName,
                      onChanged: (value) {},
                      readonly: true,
                      ontapped: () {
                        Get.bottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            SelectEmployeeBottomSheet());
                      },
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: AppTheme.primaryColor,
                      ),
                      controller: TextEditingController(),
                    );
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextFormField(
                  height: 55.h,
                  width: double.infinity,
                  contentPadding: EdgeInsets.only(
                      left: 15.sp, right: 30.sp, top: 15.sp, bottom: 15.sp),
                  hintText: "Assign seat No.",
                  textInputType: TextInputType.number,
                  onChanged: (value) {},
                  suffixIcon: Icon(
                    Icons.chair,
                    color: AppTheme.primaryColor,
                  ),
                  controller: selectSeatController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                PrimaryContinueButton(
                    width: 400.w,
                    text: "Assign",
                    ontap: () {
                      employeeListController.assignAssetToEmployees(
                          selectSeatController.text,
                          "Chair saga ", // Chair
                          "Chair", //plastic
                          "Islamabad"); //islamabad
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
