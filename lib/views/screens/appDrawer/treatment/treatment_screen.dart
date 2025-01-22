import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';

class TreatmentScreen extends StatefulWidget {
  @override
  _TreatmentScreenState createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  List<Map<String, String>> treatments = [];
  TextEditingController treatmentController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // Format price as currency
  String formatCurrency(double price) {
    final NumberFormat formatter = NumberFormat.simpleCurrency();
    return formatter.format(price);
  }

  void _addTreatment() {
    if (treatmentController.text.isEmpty || priceController.text.isEmpty) {
      Get.snackbar('Error!', 'Please fill all fields');
      return;
    }

    setState(() {
      treatments.add({
        'treatmentName': treatmentController.text,
        'price': priceController.text,
      });
    });

    treatmentController.clear();
    priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Treatment", style: AppStyles.fontSize14()),
        backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (treatments.isNotEmpty)
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Treatment Name', style: TextStyle(color: Colors.black)),
                  SizedBox(width: 120.w),
                  Text('Price', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            // Display the list of treatments
            Expanded(
              child: treatments.isEmpty
                  ? Center(child: Text('No treatments added yet.', style: TextStyle(color: Colors.black)))
                  : ListView.builder(
                itemCount: treatments.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 205.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              treatments[index]['treatmentName']!,
                              style: TextStyle(color: AppColors.color424242),
                            ),
                          ),
                        ),
                        // Price with Border
                        Container(
                          height: 44.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              treatments[index]['price']!,
                              style: TextStyle(color: AppColors.color424242),
                            ),
                          ),
                        ),
                        // Delete Button (IconButton)
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            setState(() {
                              treatments.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: CustomTextField(
                      controller: treatmentController,
                      contentPaddingVertical: 5,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: CustomTextField(
                      controller: priceController,
                      contentPaddingVertical: 5,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CustomButton(
                  width: 8.w,
                  height: 45.h,
                  onTap: _addTreatment,
                  text: 'Add',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
