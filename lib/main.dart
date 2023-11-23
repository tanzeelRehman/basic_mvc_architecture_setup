import 'package:basic_mvc_architecture_setup/core/constants/app_pages.dart';
import 'package:basic_mvc_architecture_setup/core/globle/globle.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/asset_details_screen.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/home_screen.dart';
import 'package:basic_mvc_architecture_setup/features/auth/view/signin_screen.dart';
import 'package:basic_mvc_architecture_setup/splash_screen.dart';
import 'package:basic_mvc_architecture_setup/features/home/view/assign_seat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dependency_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 804),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: GetMaterialApp(
            navigatorKey: navigatorKeyGlobal,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            getPages: [
              GetPage(
                  name: AppPages.splashPage, page: () => const SplashScreen()),
              GetPage(
                  name: AppPages.loginPage, page: () => const SignInScreen()),
              GetPage(name: AppPages.homePage, page: () => HomeScreen()),
              GetPage(
                  name: AppPages.assignSeatPage,
                  page: () => const AssignSeatPage()),
              // GetPage(
              //     name: AppPages.employeeProfilePage,
              //     page: () => const EmployeeProfileScreen(),  ),
              // GetPage(
              //     name: AppPages.employeeAssetDetailsPage,
              //     page: () => const AssetDetailScreen()),
            ],
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
