import 'package:flutter/material.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';

Widget CustomContainer({
  required String imagePath,
  required String containerName,
  required String text2,
}) {
  return Container(
    width: 155,
    height: 61,
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 1, color: AppColors.border1Color),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath, width: 42, height: 42),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                containerName,
                style: CustomTextStyles.f12W400(color: AppColors.textColor1),
              ),
              SizedBox(height: 2),
              Text(
                text2,
                style: CustomTextStyles.f12W400(color: AppColors.textColor1),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
