// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_mvc_architecture_setup/core/constants/app_assets.dart';
import 'package:basic_mvc_architecture_setup/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/core/widgets/custom_text_formfield.dart';

import '../../../core/widgets/primary_continuebutton.dart';
import '../../home/controller/employee_list_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController authController = Get.find<AuthController>();
  final EmployeeListController employeeListController =
      Get.put(EmployeeListController());
  static final GlobalKey<FormState> _loginScreenFormKey =
      GlobalKey<FormState>();
  final TextEditingController loginEmailController = TextEditingController();

  final TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const FlutterLogo(size: 20,),
                Padding(
                  padding: EdgeInsets.only(top: 22.h, bottom: 25),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Image.asset(
                        AppAssets.aislogo,
                        color: Colors.white,
                        fit: BoxFit.contain,
                      )),
                ),
                Text(
                  'Welcome Back!',
                  style: AppTheme.heading1
                      .copyWith(color: AppTheme.primaryColor, fontSize: 25.sp),
                ),
                Text(
                  'Please login to your account',
                  style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Form(
                    key: _loginScreenFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          width: double.infinity,
                          hintText: "Email",
                          onChanged: (value) {},
                          suffixIcon: Icon(
                            Icons.alternate_email,
                            color: AppTheme.primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppTheme.primaryColor,
                          ),
                          controller: loginEmailController,
                        ),
                        SizedBox(height: 28.h),
                        CustomTextFormField(
                          textInputAction: TextInputAction.done,
                          width: double.infinity,
                          hintText: "Password",
                          onChanged: (value) {},
                          isPassword: true,
                          obsecure: true,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppTheme.primaryColor,
                          ),
                          controller: loginPasswordController,
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 45.h),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: AppTheme.primaryColor),
                      ),
                    ),
                  ),
                ),
                PrimaryContinueButton(
                  text: "Login",
                  ontap: () {
                    String username = loginEmailController.text;
                    debugPrint('on tapped');
                    authController.login(loginEmailController.text,
                        loginPasswordController.text);
                    // String username = loginEmailController.text;
                    // authController.login(username, loginPasswordController.text
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
