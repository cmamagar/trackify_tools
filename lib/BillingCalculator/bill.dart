import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/bill_screen_controller.dart';
import 'package:trackify_tools/model/product.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';
import 'package:trackify_tools/widgets/bill_screen_widget.dart';

class Bill extends StatelessWidget {
  final c = Get.put(BillScreenController());
  Bill({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Billing".tr,
          style: CustomTextStyles.f24W600(color: AppColors.whiteColor),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Invoice".tr, // Replaced with translation key
                    style:
                        CustomTextStyles.f32W600(color: AppColors.primaryColor),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bill No:".tr, // Replaced with translation key
                      style: CustomTextStyles.f12W600(
                          color: AppColors.borderColor),
                    ),
                    Obx(() => Text(
                          "Date: ${c.formattedDate.value}"
                              .tr, // Replaced with translation key
                          style: CustomTextStyles.f12W600(
                              color: AppColors.borderColor),
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Vat No:".tr, // Replaced with translation key
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 8),
                Text(
                  "Name of Buyers: ${product.customerName}"
                      .tr, // Included customer name
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 8),
                Text(
                  "Address: ${product.address}"
                      .tr, // Included address from product
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 15),
                BillWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
