import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/core/widgets/custom_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {Key? key,
      this.screeData,
      required this.title,
      this.leading,
      this.subTitle,
      this.trailing,
      this.backgroundColor,
      this.onBack})
      : super(key: key);

  MediaQueryData? screeData;
  final String title;
  Widget? trailing;
  Widget? leading;
  String? subTitle;
  Color? backgroundColor;
  Function? onBack;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? Colors.transparent,
      child: SizedBox(
        width: screeData == null
            ? MediaQuery.of(context).size.width
            : screeData!.size.width,
        height: 85.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 20.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
                          if (onBack != null) {
                            onBack!();
                          }
                        },
                        child: leading ??
                            const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 15,
                            )),
                  ),
                  Text(
                    title,
                    style: AppTheme.heading1.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 25.w),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            const CustomLine()
          ],
        ),
      ),
    );
  }
}
