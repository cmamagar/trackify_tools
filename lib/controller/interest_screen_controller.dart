import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestCalculatorController extends GetxController {
  // Text Editing Controllers for each input field
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  // A variable to hold the calculated result
  var result = ''.obs;

  // GlobalKey for form validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Method to calculate interest
  void calculateInterest() {
    // Parsing input values to perform calculations
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    double time = double.tryParse(timeController.text) ?? 0.0;

    // Check if inputs are valid
    if (principal > 0 && rate > 0 && time > 0) {
      // Calculating simple interest
      double interest = (principal * rate * time) / 100;

      // Updating the result value
      result.value = interest.toStringAsFixed(2);
    } else {
      result.value = 'Please enter valid values.'.tr;
    }
  }

  // Method to reset all inputs
  void onClose() {
    principalController.clear();
    rateController.clear();
    timeController.clear();
    result.value = ''; // Reset result
  }
}
