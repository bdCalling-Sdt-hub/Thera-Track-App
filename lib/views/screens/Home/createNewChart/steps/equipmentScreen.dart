import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';

class EquipmentScreen extends StatefulWidget {
  @override
  _EquipmentScreenState createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  final Map<String, int> equipment = {
    "Horse Shoes": 1,
    "Lead": 1,
    "Ear Net": 1,
    "Hoof Pick": 1,
    "Hoof": 1,

  };

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
      appBar: AppBar(
        title: Text("Equipment",
        style: AppStyles.fontSize16(fontWeight: FontWeight.w500)),
        centerTitle: true
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
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
              child: ListView(
                children: equipment.keys.map((item) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item, style: AppStyles.fontSize16(color: AppColors.colorB1B1B1)),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline,color: AppColors.colorB1B1B1),
                            onPressed: () => _decrement(item),
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
                              "${equipment[item] ?? 1}",
                              style: AppStyles.fontSize16(color: AppColors.color707070)
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline,color: AppColors.colorB1B1B1,),
                            onPressed: () => _increment(item),
                          ),
                        ],
                      ),
                    ],
                  );
                }).toList(),
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
