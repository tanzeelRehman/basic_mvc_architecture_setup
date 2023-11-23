import 'package:basic_mvc_architecture_setup/core/constants/app_assets.dart';
import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 300));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: Center(
        child: SizedBox(
            height: 200,
            child: Image.asset(
              AppAssets.aislogo,
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
