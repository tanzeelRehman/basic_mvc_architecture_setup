// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:basic_mvc_architecture_setup/core/widgets/primary_continuebutton.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_text_formfield.dart';

class EditSeatNoBottomSheet extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController seatController = TextEditingController();

  String employeeName;
  EditSeatNoBottomSheet({
    Key? key,
    required this.employeeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
          height: 250,
          decoration: BoxDecoration(
              color: AppTheme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text("Change $employeeName seat",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey)),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.chair,
                    color: AppTheme.primaryColor,
                  ),
                  textInputType: TextInputType.phone,
                  hintText: "Enter seat no.",
                  controller: seatController),
              const SizedBox(
                height: 15,
              ),
              PrimaryContinueButton(
                text: "Save",
                ontap: () {},
              )
            ],
          )),
    );
  }
}
