// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:simple_tax/controller/expenses_screen_controller.dart';
// import 'package:simple_tax/controller/image_picker_controller.dart';
// import 'package:simple_tax/utils/colors.dart';
// import 'package:simple_tax/utils/custom_text_styles.dart';
// import 'package:simple_tax/utils/image_path.dart';
// import 'package:simple_tax/widgets/custom/custom_textfield.dart';
// import 'package:simple_tax/widgets/custom/elevated_button.dart';

// void showAddCategoryBottomSheet(BuildContext context) {
//   final c = Get.put(ExpensesScreenController());
//   // final picker = Get.put(ImagePickerController());

//   showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (BuildContext context) {
//       return Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "Add New Category",
//               style: CustomTextStyles.f18W600(color: AppColors.textColor),
//             ),
//             SizedBox(height: 20),
//             CustomTextField(
//               hint: "Category Name",
//               textInputAction: TextInputAction.done,
//               textInputType: TextInputType.name,
//             ),
//             SizedBox(height: 10),
//             CustomTextField(
//               hint: "Enter Date",
//               controller: c.dateController,
//               readOnly: true,
//               textInputAction: TextInputAction.done,
//               textInputType: TextInputType.datetime,
//               suffixIconPath: ImagePath.calender,
//               suffixIconColor: AppColors.primaryColor,
//               onTap: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   c.dateController.text =
//                       "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 95, horizontal: 50),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: CustomElevatedButton(
//                       title: "Save",
//                       onTap: () {
                        
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: 50,
//                   ),
//                   IconButton(
//                     onPressed: () async {
//                       // await picker.pickImageFromGallery();
//                     },
//                     icon: Icon(
//                       Icons.camera_alt,
//                       size: 40,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
