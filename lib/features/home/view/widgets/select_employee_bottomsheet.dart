import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/core/widgets/custom_line.dart';
import 'package:basic_mvc_architecture_setup/core/widgets/custom_text_formfield.dart';
import 'package:basic_mvc_architecture_setup/features/home/controller/employee_list_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectEmployeeBottomSheet extends StatelessWidget {
  TextEditingController searchPersonController = TextEditingController();
  EmployeeListController employeeListController =
      Get.find<EmployeeListController>();
  FocusNode searchfoucnode = FocusNode();

  SelectEmployeeBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.roundedContainerDecoration
          .copyWith(color: AppTheme.canvasColor),
      height: MediaQuery.of(context).size.height * 0.8.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "AIS Employees",
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.drag_handle_rounded,
                  color: AppTheme.primaryColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: const CustomLine(),
          ),
          SizedBox(
            height: 10.h,
          ),
          SingleChildScrollView(
              child: Column(
            children: [
              CustomTextFormField(
                height: 55.h,
                width: double.infinity,
                focusNode: searchfoucnode,
                hintText: "Search by name",
                onChanged: (value) {
                  employeeListController.filterUnAssignContactList(value);
                },
                prefixIcon: Icon(
                  Icons.search,
                  color: AppTheme.primaryColor,
                ),
                controller: searchPersonController,
              ),
              const SizedBox(
                height: 25,
              ),
              Obx(() => SizedBox(
                    height: searchfoucnode.hasFocus
                        ? MediaQuery.of(context).size.height * 0.4
                        : MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        itemCount: employeeListController
                            .unAssignEmployeeFilteredList.length,
                        itemBuilder: ((context, index) {
                          if (employeeListController
                              .unAssignEmployeeFilteredList.isEmpty) {
                            return const Center(
                              child: Text("No Employee found"),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                employeeListController.selectEmployeeName(
                                  employeeListController
                                      .unAssignEmployeeFilteredList[index]
                                      .firstName,
                                  employeeListController
                                      .unAssignEmployeeFilteredList[index].id,
                                );
                                if (Get.isBottomSheetOpen ?? false) {
                                  Get.back();
                                }
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 5.h),
                                decoration: AppTheme.roundedContainerDecoration,
                                height: 65.h,
                                width: double.infinity - 50,
                                child: Row(
                                  children: [
                                    Icon(
                                      size: 25.sp,
                                      Icons.person,
                                      color: AppTheme.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          employeeListController
                                              .unAssignEmployeeFilteredList[
                                                  index]
                                              .firstName,
                                          style: AppTheme.heading1
                                              .copyWith(fontSize: 15),
                                        ),
                                        Text(
                                          employeeListController
                                              .unAssignEmployeeFilteredList[
                                                  index]
                                              .email,
                                          style: AppTheme.subtitle1
                                              .copyWith(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        })),
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
