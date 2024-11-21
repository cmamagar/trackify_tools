import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/widgets/custom/expenses_screen_widget.dart';


class ExpensesScreenController extends GetxController {
  TextEditingController dateController = TextEditingController();
  var selectedIndex = 0.obs;
  void changeTab(int index) {
    selectedIndex.value = index;
    
  }
  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final double radius = 45;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.primaryColor,
            value: 34.4,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.star, title: '34.4%', color: Colors.white),
            badgePositionPercentageOffset: 0.50, // Adjust the position
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.errorColor,
            value: 14.6,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.thumb_up, title: '14.6%', color: Colors.white),
            badgePositionPercentageOffset: 0.50,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.shopping,
            value: 51,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.pie_chart, title: '51%', color: Colors.white),
            badgePositionPercentageOffset: 0.50,
          );
        default:
          throw Error();
      }
    });
  }

}




