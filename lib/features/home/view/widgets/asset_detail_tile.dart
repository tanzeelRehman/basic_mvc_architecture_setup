import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetDetailTile extends StatefulWidget {
  String name;
  String model;
  String? assetId;

  String? assignedDate;
  String? assignedLocation;
  Function() ondelete;

  bool active;

  AssetDetailTile(
      {Key? key,
      required this.name,
      required this.model,
      this.assignedDate,
      this.assetId,
      this.assignedLocation,
      required this.ondelete,
      this.active = false})
      : super(key: key);

  @override
  State<AssetDetailTile> createState() => _AssetDetailTileState();
}

class _AssetDetailTileState extends State<AssetDetailTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: AppTheme.canvasColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(2, 3))
          ],
          border: Border(
              left: BorderSide(width: 4.0, color: AppTheme.primaryColor))),
      //  height: 165.h,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: AppTheme.heading1.copyWith(fontSize: 18.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              widget.model,
              style: AppTheme.subtitle1
                  .copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 2,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10.0.sp),
              color: Colors.grey.withOpacity(0.3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Assigned date:",
                        style: AppTheme.subtitle1.copyWith(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        widget.assignedDate?.substring(0, 10) ?? "-/-/-",
                        style: AppTheme.subtitle1.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Location:",
                        style: AppTheme.subtitle1.copyWith(
                            fontSize: 11.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        widget.assignedLocation ?? "-",
                        style: AppTheme.subtitle1.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Asset ID",
                  style: AppTheme.subtitle1,
                ),
                Text(
                  widget.assetId ?? "-",
                  style: AppTheme.subtitle1.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor),
                ),

                Text(
                  "Delete",
                  style: AppTheme.subtitle1,
                ),
                IconButton(
                    onPressed: widget.ondelete,
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ))
                // Switch(
                //     activeColor: AppTheme.primaryColor,
                //     value: true,
                //     onChanged: (value) {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
