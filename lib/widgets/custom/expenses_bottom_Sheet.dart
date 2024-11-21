import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/expenses_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';
import 'package:trackify_tools/utils/image_path.dart';
import 'package:trackify_tools/widgets/custom/custom_textfield.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';

void expensesBottomSheet(BuildContext context) {
  final c = Get.put(ExpensesScreenController());
  // final picker = Get.put(ImagePickerController());

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true, // Ensures the bottom sheet can take more space
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Ensure content takes only required space
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add New Expenses Details",
                    style: CustomTextStyles.f18W600(color: AppColors.textColor),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    hint: "Enter Spended Money",
                    labelText: "Enter Amount",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hint: "Enter Date",
                    labelText: "Enter Date",
                    controller: c.dateController,
                    readOnly: true,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.datetime,
                    suffixIconPath: ImagePath.calender,
                    suffixIconColor: AppColors.primaryColor,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        c.dateController.text =
                            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hint: "Write how/where did you spend the money...",
                    labelText: "Enter Note",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.name,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Fixed bottom container for the button and camera
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: CustomElevatedButton(
                        title: "Save",
                        onTap: () {
                          // Save logic
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () async {
                      // await picker.pickImageFromGallery();
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.grey[700], // Customize the icon color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
