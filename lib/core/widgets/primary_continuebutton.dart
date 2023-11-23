import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrimaryContinueButton extends StatelessWidget {
  String text;
  Function() ontap;
  double? width;
  PrimaryContinueButton({
    Key? key,
    this.width,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 50,
        width: width ?? double.infinity,
        child: Container(
          decoration: AppTheme.roundedContainerDecoration
              .copyWith(color: AppTheme.primaryColor),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
