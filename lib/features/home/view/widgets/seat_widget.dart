import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeatWidget extends StatelessWidget {
  String name;
  String email;
  String seatNo;
  Function onEdit;
  SeatWidget({
    Key? key,
    required this.name,
    required this.email,
    required this.seatNo,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(2, 3))
          ],
          borderRadius: BorderRadius.circular(15.r),
          color: AppTheme.canvasColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 38.w,
            child: Text(
              seatNo.toString(),
              style: AppTheme.subtitle2.copyWith(color: AppTheme.primaryColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Container(
              height: 50,
              color: Colors.white,
              width: 2,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: AppTheme.heading1
                    .copyWith(fontSize: 20, color: AppTheme.primaryColor),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                email,
                style: AppTheme.subtitle1
                    .copyWith(color: Colors.white, fontSize: 12.sp),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              onEdit();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: Icon(
                Icons.person_2,
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
