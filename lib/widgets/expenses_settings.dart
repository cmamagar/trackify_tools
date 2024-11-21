import 'package:flutter/material.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';


class ExpensesSettings extends StatelessWidget {
  const ExpensesSettings({
    super.key,
    required this.icon,
    required this.name,
    required this.colors,
    this.onTap,
    this.isSelectable = false, 
  });

  final String icon;
  final Color colors;
  final bool isSelectable;
  final String name;
  final VoidCallback? onTap; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          children: [
            Container(
              height: 44,
              width: 44,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                icon,
                color: Colors.white,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: CustomTextStyles.f12W600(),
            ),
          ],
        ),
      ),
    );
  }
}
