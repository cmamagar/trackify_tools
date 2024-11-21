import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';
import 'package:trackify_tools/utils/image_path.dart';


class HomeFirstImageWidget extends StatelessWidget {
  const HomeFirstImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18),
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryTextColor,
            blurRadius: 4,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "banner".tr,
                      style:
                          CustomTextStyles.f14W600(color: AppColors.textColor1),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 35,
                      width: 85,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor, // Background color
                        borderRadius:
                            BorderRadius.circular(15), // Circular radius
                      ),
                      child: Center(
                        child: Text(
                          "explore".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.whiteColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox(width: 16),
            Image.asset(
              ImagePath.first, // Ensure this path is correct
              height: 105,
              width: 138,
            ),
          ],
        ),
      ),
    );
  }
}
