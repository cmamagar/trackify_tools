import 'package:get/get.dart';

class SavingScreenController extends GetxController {
  var interestRate = "".obs; // Initialize with a default value
  var period = "".obs; // Changed to an integer to represent period
  var interestType = 'Annual'.obs;
  var periodType = 'Years'.obs;

  // Dropdown items for interest type and period type
  List<String> interestTypes = ['Annual', 'Monthly'];
  List<String> periodTypes = ['Years', 'Months'];

  // Methods to increment/decrement interest rate
  void incrementRate() {
    interestRate.value = (double.parse(interestRate.value) + 0.5).toString();
  }

  void decrementRate() {
    interestRate.value = (double.parse(interestRate.value) - 0.5).toString();
  }

  // Methods to increment/decrement period
  void incrementPeriod() {
    period.value = (double.parse(interestRate.value) + 1).toString();
  }

  void decrementPeriod() {
    period.value = (double.parse(interestRate.value) - 1).toString();
  }

  // Method to update interest rate from dropdown
  void updateInterestRate(String value) {
    interestRate.value = value;
  }

  // Method to update period from dropdown
  void updatePeriod(String value) {
    period.value = value; 
  }
}
