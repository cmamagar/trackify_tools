import 'package:flutter/material.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';


class donutPieChart extends StatelessWidget {
  const donutPieChart({
    super.key,
    required this.iconData,
    required this.title,
    required this.color,
  });

  final IconData iconData;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: color,
          size: 18,
        ),
        const SizedBox(height: 2), // Spacing between icon and text
        Text(title, style: CustomTextStyles.f12W400()),
      ],
    );
  }
}