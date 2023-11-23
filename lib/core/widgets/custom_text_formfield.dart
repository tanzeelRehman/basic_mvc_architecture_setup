import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obsecure;
  bool isPassword;
  double height;
  double width;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  Function(String value)? onChanged;
  EdgeInsetsGeometry? contentPadding;
  Function()? ontapped;
  bool readonly;
  CustomTextFormField(
      {Key? key,
      required this.controller,
      this.hintText = "Input here",
      this.height = 55,
      this.width = double.infinity,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.onChanged,
      this.obsecure = false,
      this.isPassword = false,
      this.contentPadding,
      this.ontapped,
      this.readonly = false,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: widget.width,
      alignment: Alignment.center,
      //  padding: EdgeInsets.symmetric(horizontal: 8.sp),
      decoration: AppTheme.roundedContainerDecoration,
      child: TextFormField(
        textInputAction: widget.textInputAction,
        onTap: widget.ontapped,
        obscureText: widget.obsecure,
        readOnly: widget.readonly,
        obscuringCharacter: "*",
        style: AppTheme.heading1
            .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
        cursorColor: Colors.grey,
        onChanged: widget.onChanged ?? (value) {},
        controller: widget.controller,
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding:
                widget.contentPadding ?? EdgeInsets.symmetric(vertical: 15.sp),
            hintStyle: AppTheme.subtitle1
                .copyWith(fontSize: 15.sp, fontWeight: FontWeight.normal),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: (() {
                      setState(() {
                        widget.obsecure = !widget.obsecure;
                      });
                    }),
                    icon: Icon(
                      color: AppTheme.primaryColor,
                      widget.obsecure ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : widget.suffixIcon ?? const SizedBox.shrink(),
            border: InputBorder.none),
      ),
    );
  }
}
