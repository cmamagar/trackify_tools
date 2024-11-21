import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/splash_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  final c = Get.put(SplashScreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.logo,
                fit: BoxFit.cover,
                height: 195,
                width: 195,
              ),
              const SizedBox(height: 45),
              const CircularProgressIndicator(
                backgroundColor: AppColors.secondaryTextColor,
                valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ));
  }
}
