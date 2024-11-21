import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/income_screen_controller.dart';


class SlabRateTable extends StatelessWidget {
  final IncomeTaxController controller;

  const SlabRateTable({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final slabData = controller.selectStatusOption.value == 'Single'
          ? controller.singleSlabs
          : controller.marriedSlabs;

      return Container(
        child: Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FixedColumnWidth(34.0),
            1: FixedColumnWidth(145.0),
            2: FixedColumnWidth(80.0),
            3: FixedColumnWidth(70.0),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('S.N'.tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Salary_slab (${controller.selectStatusOption.value})'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('rate'.tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('taxable_amt'.tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            ...slabData.map((slab) {
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(slab[0].tr),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(slab[1].tr),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(slab[2].tr),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(slab[3].tr),
                    ),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      );
    });
  }
}
