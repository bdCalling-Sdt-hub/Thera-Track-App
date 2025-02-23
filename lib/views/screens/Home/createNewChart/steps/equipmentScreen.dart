import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/controller/clientController/inventoryController.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';

class EquipmentScreen extends StatefulWidget {
  @override
  _EquipmentScreenState createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  final InventoryController inventoryController = Get.put(InventoryController());

  // Store quantity for each item
  Map<String, int> equipment = {};

  @override
  void initState() {
    super.initState();
    inventoryController.getAllInventory().then((_) {
      setState(() {
        // Initialize equipment quantity with 1 for each product
        for (var item in inventoryController.getAllInventoryModel) {
          equipment[item.productName ?? 'N/A'] = 1;
        }
      });
    });
  }

  void _increment(String item) {
    setState(() {
      equipment[item] = (equipment[item] ?? 1) + 1;
    });
  }

  void _decrement(String item) {
    setState(() {
      if ((equipment[item] ?? 1) > 1) {
        equipment[item] = (equipment[item] ?? 1) - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text(
          "Equipment",
          style: AppStyles.fontSize16(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product name", style: AppStyles.fontSize16(color: AppColors.color424242)),
                Text("Quantity", style: AppStyles.fontSize16(color: AppColors.color424242)),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: inventoryController.getAllInventoryModel.length,
                itemBuilder: (context, index) {
                  var displayData = inventoryController.getAllInventoryModel[index];
                  String itemName = displayData.productName ?? 'N/A';

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            itemName,
                            style: AppStyles.fontSize16(color: AppColors.colorB1B1B1),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline, color: AppColors.colorB1B1B1),
                              onPressed: () => _decrement(itemName),
                            ),
                            Container(
                              width: 60.w,
                              height: 40.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.colorB1B1B1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "${equipment[itemName] ?? 1}",
                                style: AppStyles.fontSize16(color: AppColors.color707070),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline, color: AppColors.colorB1B1B1),
                              onPressed: () => _increment(itemName),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.createNewChartStepSixScreen);
              },
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
