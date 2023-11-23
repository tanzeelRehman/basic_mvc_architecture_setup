// import 'dart:ui';

// import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
// import 'package:basic_mvc_architecture_setup/features/home/controller/employee_list_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:get/get.dart';

// class SelectEmployeeDropDown extends StatefulWidget {
//   const SelectEmployeeDropDown({Key? key}) : super(key: key);

//   @override
//   State<SelectEmployeeDropDown> createState() => _SelectEmployeeDropDownState();
// }

// class _SelectEmployeeDropDownState extends State<SelectEmployeeDropDown> {
//   TextEditingController suggestionController = TextEditingController();
//   bool showClearIconButton = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     print(showClearIconButton);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<EmployeeListController>(
//       builder: (controller) {
//         return BackdropFilter(
//           filter: ImageFilter.blur(
//               sigmaX: controller.sigmaXblur, sigmaY: controller.sigmaYblur),
//           child: Container(
//             height: 55.h,
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.symmetric(horizontal: 12.w),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.r),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: const Offset(
//                       3,
//                       4.5,
//                     ),
//                     color: Theme.of(context).hintColor.withOpacity(.4),
//                     blurRadius: 5.5,
//                     spreadRadius: -1.5,
//                   )
//                 ],
//                 color: AppTheme.canvasColor),
//             alignment: Alignment.center,
//             child: SizedBox(
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: TypeAheadField(
//                       onSuggestionsBoxToggle: (p0) {
//                         if (p0) {
//                           controller.onDropdowntapped();
//                         }
//                         if (!p0) {
//                           controller.onDropdownitemSelected();
//                         }
//                       },
//                       hideOnEmpty: true,
//                       getImmediateSuggestions: true,
//                       suggestionsBoxVerticalOffset: 10,
//                       suggestionsBoxDecoration: SuggestionsBoxDecoration(
//                           borderRadius: BorderRadius.circular(12.r),
//                           elevation: 0.0,
//                           color: AppTheme.scaffoldBackgroundColor),
//                       textFieldConfiguration: TextFieldConfiguration(
//                           controller: suggestionController,
//                           autofocus: false,
//                           style: AppTheme.subtitle1,
//                           cursorColor: Colors.grey,
//                           decoration: InputDecoration(
//                               suffixIcon: Icon(
//                                 Icons.arrow_drop_down,
//                                 color: AppTheme.primaryColor,
//                               ),
//                               hintText: "Select employee",
//                               hintStyle:
//                                   AppTheme.subtitle1.copyWith(fontSize: 15),
//                               border: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                               // contentPadding: EdgeInsets.symmetric(
//                               //     vertical: 6.h, horizontal: 10.sp),
//                               enabledBorder: InputBorder.none)),
//                       suggestionsCallback: (pattern) async {
//                         return fetchPlaceSuggestions();
//                       },
//                       itemBuilder: (
//                         context,
//                         suggestion,
//                       ) {
//                         return GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(vertical: 15),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15.w, vertical: 5.h),
//                             decoration: AppTheme.roundedContainerDecoration,
//                             height: 65.h,
//                             width: MediaQuery.of(context).size.width * 0.8,
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   size: 25.sp,
//                                   Icons.person,
//                                   color: AppTheme.primaryColor,
//                                 ),
//                                 SizedBox(
//                                   width: 15.w,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Tanzeel ur rehman",
//                                       style: AppTheme.heading1
//                                           .copyWith(fontSize: 15),
//                                     ),
//                                     Text(
//                                       "flutter",
//                                       style: AppTheme.subtitle1
//                                           .copyWith(fontSize: 12),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       onSuggestionSelected: (suggestion) {
//                         controller.onDropdownitemSelected();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future<List<String>> fetchPlaceSuggestions() async {
//     return Future.value(List.generate(2, (index) {
//       return ['a', 'b'][index];
//     }));
//   }
// }
