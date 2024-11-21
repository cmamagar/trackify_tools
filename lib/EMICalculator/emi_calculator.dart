import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/EMICalculator/emi_bill.dart';
import 'package:trackify_tools/controller/emi_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';
import 'package:trackify_tools/utils/image_path.dart';
import 'package:trackify_tools/widgets/custom/custom_textfield.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';

class EmiCalculator extends StatelessWidget {
  final EmiController emiController = Get.put(EmiController());
  EmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "emi_calculator".tr,
          style: CustomTextStyles.f18W600(color: AppColors.whiteColor),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 1.3,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            // Add SingleChildScrollView here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "loan_amount".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                CustomTextField(
                  controller: emiController.loanAmountController,
                  hint: "loan_amount".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Text(
                  "tenure_years".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                CustomTextField(
                  controller: emiController.tenureYearsController,
                  hint: "Year".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Text(
                  "Interest Rate (%)".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                CustomTextField(
                  controller: emiController.interestRateController,
                  hint: "rate(%)".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Text(
                  "emi_type".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: AppColors.whiteColor,
                  ),
                  child: Obx(() => DropdownButtonFormField<String>(
                        value: emiController.selectedEmiTypeOption.value.isEmpty
                            ? null
                            : emiController.selectedEmiTypeOption.value,
                        hint: Text(
                          "EmiType".tr,
                          style: CustomTextStyles.f12W400(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.borderColor, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 1),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          ImagePath.textFieldIcon,
                          color: AppColors.borderColor,
                        ),
                        items: emiController.typeOptions
                            .map((option) => DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option.tr,
                                      style: CustomTextStyles.f12W600(
                                          color: AppColors.textColor)),
                                ))
                            .toList(),
                        onChanged: (value) {
                          emiController.updateSelected(value!);
                        },
                        validator: (value) =>
                            value == null ? 'PleaseSelectEmiType'.tr : null,
                      )),
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  title: "submit".tr,
                  onTap: () {
                    Get.to(() => EmiBill(
                          loanAmount: emiController.loanAmountController.text,
                          tenureYears: emiController.tenureYearsController.text,
                          interestRate:
                              emiController.interestRateController.text,
                          emiType: emiController.selectedEmiTypeOption
                              .value, // Pass selected EMI type
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
