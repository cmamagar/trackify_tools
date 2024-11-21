import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiController extends GetxController {
  final TextEditingController loanAmountController = TextEditingController();
  final TextEditingController tenureYearsController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController emiTypeController =
      TextEditingController(); // Removed unnecessary controllers

  // Variables to hold the calculated EMI and related details
  var emiResult = 0.0.obs;
  var totalAmountWithInterest = 0.0.obs;
  var totalInterestAmount = 0.0.obs;

  var selectedEmiTypeOption = "".obs;
  final List<String> typeOptions = [
    'Monthly',
    '3 Months',
    '6 Months',
    'Yearly'
  ];

  void updateSelected(String value) {
    selectedEmiTypeOption.value = value;
  }

  // Method to calculate EMI
  void calculateEmi() {
    // Try to parse the input, with a fallback value
    double loanAmount = double.tryParse(loanAmountController.text) ?? 0.0;
    double tenureYears = double.tryParse(tenureYearsController.text) ?? 0.0;
    double interestRate = double.tryParse(interestRateController.text) ?? 0.0;

    // Return early if any input is invalid
    if (loanAmount <= 0 || tenureYears <= 0 || interestRate <= 0) {
      emiResult.value = 0.0;
      totalAmountWithInterest.value = 0.0;
      totalInterestAmount.value = 0.0;
      return;
    }

    // Determine the number of months based on the selected EMI type
    double tenureMonths;
    if (selectedEmiTypeOption.value == 'Monthly') {
      tenureMonths = tenureYears * 12; // Convert years to months
    } else if (selectedEmiTypeOption.value == '3 Months/Quarterly') {
      tenureMonths = tenureYears * 4; // Convert years to quarters
    } else if (selectedEmiTypeOption.value == '6 Months/Semi-Annually') {
      tenureMonths = tenureYears * 2; // Convert years to semi-annual periods
    } else if (selectedEmiTypeOption.value == 'Yearly/Annually') {
      tenureMonths = tenureYears; // Already in years, so same value
    } else {
      emiResult.value = 0.0;
      totalAmountWithInterest.value = 0.0;
      totalInterestAmount.value = 0.0;
      return; // Exit if no valid type is selected
    }

    // Common parameters
    double monthlyInterestRate = interestRate / (12 * 100);
    double emi;

    // Formula for EMI
    emi = (loanAmount *
            monthlyInterestRate *
            pow(1 + monthlyInterestRate, tenureMonths)) /
        (pow(1 + monthlyInterestRate, tenureMonths) - 1);

    // Set the calculated values
    emiResult.value = emi.isNaN ? 0.0 : emi;
    totalAmountWithInterest.value = emiResult.value * tenureMonths;
    totalInterestAmount.value = totalAmountWithInterest.value - loanAmount;
  }

  // Clean up the controllers when the controller is disposed
  @override
  void onClose() {
    loanAmountController.dispose();
    tenureYearsController.dispose();
    interestRateController.dispose();
    emiTypeController.dispose();

    super.onClose();
  }
}
