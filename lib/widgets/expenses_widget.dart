import 'package:flutter/material.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';


class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({
    super.key,
    required this.icon,
    required this.name,
    required this.amount,
    required this.colors,
  });
  final IconData icon;
  final Color colors;
  final String name;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: CustomTextStyles.f14W600(
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  "- Rs. ${amount}",
                  style: CustomTextStyles.f14W600(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
