import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.withOpacity(.5),
      width: double.infinity,
    );
  }
}
