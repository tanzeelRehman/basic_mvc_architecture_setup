import 'package:basic_mvc_architecture_setup/core/network/network_info.dart';
import 'package:basic_mvc_architecture_setup/features/auth/controllers/auth_controller.dart';
import 'package:basic_mvc_architecture_setup/features/auth/data/auth_datasource.dart';
import 'package:basic_mvc_architecture_setup/features/home/controller/assets_controller.dart';
import 'package:basic_mvc_architecture_setup/features/home/controller/employee_list_controller.dart';
import 'package:basic_mvc_architecture_setup/features/home/data/home_datasource.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> init() async {
  //! GETX CONTROLLERS --------------->
  Get.lazyPut(() => EmployeeListController());
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => AssetsController(), fenix: true);

  //! Data Sources
  Get.lazyPut(() => AuthDataSource());
  Get.lazyPut(() => HomeDataSource());

  //! External ------------------->
  //* DIO Configurations
  Get.lazyPut<Dio>(() => Dio(
        BaseOptions(
          receiveTimeout: const Duration(seconds: 5),
          connectTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      ));
  //..interceptors.add(AppInterceptors()));
  Get.lazyPut<InternetConnectionChecker>(() => InternetConnectionChecker());

  //! Core ------------------------>
  Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(Get.find<InternetConnectionChecker>()));

  //sl.registerLazySingleton(() => );
}
