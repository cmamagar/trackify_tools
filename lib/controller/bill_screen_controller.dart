import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

class BillScreenController extends GetxController {
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController =
      TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Controllers for the input fields
  TextEditingController serialNoController = TextEditingController();
  TextEditingController hsCodeController = TextEditingController();
  TextEditingController particularsController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  // List to store table rows
  var tableData = <Map<String, dynamic>>[].obs;

  // Function to add new row to the table
  void addRow() {
    tableData.add({
      'serialNo': serialNoController.text,
      'hsCode': hsCodeController.text,
      'particulars': particularsController.text,
      'quantity': quantityController.text,
      'rate': rateController.text,
      'amount': (double.tryParse(quantityController.text) ?? 0) *
          (double.tryParse(rateController.text) ?? 0)
    });

    // Clear the text fields after adding a row
    serialNoController.clear();
    hsCodeController.clear();
    particularsController.clear();
    quantityController.clear();
    rateController.clear();
  }

  late final DateTime now;
  late RxString formattedDate = ''.obs;
  var serialNumber = "".obs;
  var hsCode = "".obs;
  var particulars = "".obs;
  var quantity = 0.obs;
  var rate = 0.0.obs;

  // Additional fields for the footer
  var total = 0.0.obs;
  var discount = 0.0.obs;
  var grandTotal = 0.0.obs;
  var vat = 0.0.obs;

  void calculateTotals() {
    // Assuming you calculate total based on quantity and rate
    total.value = quantity.value * rate.value;
    vat.value = total.value * 0.13; // 13% VAT
    grandTotal.value = total.value + vat.value - discount.value;
  }

  BillScreenController() {
    now = DateTime.now();
    _updateFormattedDate();
  }

  void _updateFormattedDate() {
    if (Get.locale?.languageCode == 'ne') {
      // For Nepali date
      NepaliDateTime nepaliNow = NepaliDateTime.fromDateTime(now);
      String nepaliDate = NepaliDateFormat('yyyy-MM-dd').format(nepaliNow);
      formattedDate.value =
          NepaliUnicode.convert(nepaliDate); // Convert to Nepali numerals
    } else {
      // For English date
      formattedDate.value = DateFormat('yyyy-MM-dd').format(now);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Listen to locale changes
    ever(Get.locale.obs, (locale) {
      _updateFormattedDate();
    });
  }

  // // List to store the inserted BillItems
  // var billItems = <BillItem>[].obs;

  // // Function to add a BillItem
  // void addBillItem(BillItem item) {
  //   billItems.add(item);
  // }

  // // Function to clear all bill items
  // void clearItems() {
  //   billItems.clear();
  // }
}
