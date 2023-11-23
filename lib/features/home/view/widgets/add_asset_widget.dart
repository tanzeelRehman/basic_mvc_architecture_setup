import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/core/widgets/custom_text_formfield.dart';
import 'package:basic_mvc_architecture_setup/features/home/controller/assets_controller.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/widgets/custom_popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAssetWidget extends StatelessWidget {
  const AddAssetWidget({
    super.key,
    required this.assetsController,
    this.assetIndex = 0,
  });

  final AssetsController assetsController;
  final int assetIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.roundedContainerDecoration,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(15.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor),
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Icon(
                    Icons.close,
                    color: AppTheme.primaryColor,
                    size: 18.sp,
                  )),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormField(
            height: 55,
            width: double.infinity,
            hintText: "Asset Name",
            onChanged: (value) {},
            prefixIcon: Icon(
              Icons.laptop_chromebook,
              color: AppTheme.primaryColor,
            ),
            controller: assetsController.addNewAssetsRecordData[assetIndex]
                ['assetNameCon'],
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            height: 55.h,
            width: double.infinity,
            onChanged: (value) {},
            hintText: "Model no",
            prefixIcon: Icon(
              Icons.warning,
              color: AppTheme.primaryColor,
            ),
            controller: assetsController.addNewAssetsRecordData[assetIndex]
                ['modelCont'],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPopupMenuButton(
                assetsController: assetsController,
                assetIndex: assetIndex,
                buttonType: "Type",
              ),
              CustomPopupMenuButton(
                assetsController: assetsController,
                assetIndex: assetIndex,
                buttonType: "Location",
              ),
            ],
          )
        ],
      ),
    );
  }
}
