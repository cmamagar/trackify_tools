import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/BillingCalculator/billing_calculator.dart';
import 'package:trackify_tools/EMICalculator/emi_calculator.dart';
import 'package:trackify_tools/ExpensesDetails/expenses_details.dart';
import 'package:trackify_tools/IncomTaxCalcultor/income_tax_calculator.dart';
import 'package:trackify_tools/InterestRateCalculator/interest_rate_calculator.dart';
import 'package:trackify_tools/SavingGoalCalculator/saving_goal_calculator.dart';
import 'package:trackify_tools/controller/home_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';
import 'package:trackify_tools/utils/image_path.dart';
import 'package:trackify_tools/widgets/custom/custom_container.dart';
import 'package:trackify_tools/widgets/home_screen_widget.dart';
import 'package:trackify_tools/widgets/testimonial_card_widget.dart';

class HomeScreen extends StatelessWidget {
  final c = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'welcome'.tr,
                          style: CustomTextStyles.f18W600(
                              color: AppColors.textColor1),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'have_a_nice_day'.tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.textColor),
                        ),
                      ],
                    ),
                    Obx(() => PopupMenuButton<String>(
                          icon: Image.asset(
                            c.currentFlag
                                .value, // Observe and display selected flag icon
                            height: 24,
                            width: 24,
                          ),
                          onSelected: (String value) {
                            c.switchLanguage(value); // Update language and flag
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'en',
                              child: Row(
                                children: [
                                  Image.asset('assets/images/usa.png',
                                      height: 20, width: 20),
                                  SizedBox(width: 10),
                                  Text(
                                    'english_language'.tr,
                                    style: CustomTextStyles.f12W600(
                                        color: AppColors.textColor),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'ne',
                              child: Row(
                                children: [
                                  Image.asset('assets/images/nepal.png',
                                      height: 20, width: 20),
                                  SizedBox(width: 10),
                                  Text(
                                    'nepali_language'.tr,
                                    style: CustomTextStyles.f12W600(
                                        color: AppColors.textColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: 16),
              HomeFirstImageWidget(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 7, bottom: 14),
                child: Text(
                  'what_are_you_looking_for'.tr,
                  style: CustomTextStyles.f14W600(color: AppColors.textColor1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => IncomeTaxCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.Incometaxcalc,
                          containerName: "income_tax".tr,
                          text2: 'calculator'.tr,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => InterestRateCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.Interestcalc,
                          containerName: "interest_rate".tr,
                          text2: 'calculator'.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => BillingCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.Billing,
                          containerName: "product_billing".tr,
                          text2: 'with_tax'.tr,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => EmiCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.emi,
                          containerName: "EMI".tr,
                          text2: 'Calculator'.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => SavingGoalCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.saving_goal_calc,
                          containerName: "Saving Goal".tr,
                          text2: 'Calculator'.tr,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ExpensesDetails());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.expensesDetails,
                          containerName: "Expenses ".tr,
                          text2: 'Details'.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 14, bottom: 4),
                child: Text(
                  'testimonials'.tr,
                  style: CustomTextStyles.f16W600(color: AppColors.textColor1),
                ),
              ),
              Container(
                child: CarouselSlider.builder(
                  itemCount: c.testimonials.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 300,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    reverse: false,
                    // aspectRatio: 10,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final testimonial = c.testimonials[index];
                    return TestimonialCard(
                      name: testimonial['name'],
                      imageUrl: testimonial['image'],
                      review: testimonial['review'],
                      rating: double.parse(testimonial['rating']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
