import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<Map<String, String>> inventory = [];
  TextEditingController treatmentController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

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
      inventory.add({
        'treatmentName': treatmentController.text,
        'price': priceController.text,
        'quantity': quantityController.text,
      });
    });

    treatmentController.clear();
    priceController.clear();
    quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Inventory", style: AppStyles.fontSize14()),
        backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h,vertical: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (inventory.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Name', style: TextStyle(color: Colors.black)),
                    SizedBox(width: 12.w),
                    Text('Price Per One', style: TextStyle(color: Colors.black)),
                    SizedBox(width: 12.w),
                    Text('Quantity', style: TextStyle(color: Colors.black)),
                    SizedBox(width :20.w)
                  ],
                ),
              ),
            // Display the list of treatments
            Expanded(
              child: inventory.isEmpty
                  ? Center(child: Text('No item added yet.', style: TextStyle(color: Colors.black)))
                  : ListView.builder(
                itemCount: inventory.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              inventory[index]['treatmentName']!,
                              style: TextStyle(color: AppColors.color424242),
                            ),
                          ),
                        ),
                        // Price with Border
                        Container(
                          height: 44.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              inventory[index]['price']!,
                              style: TextStyle(color: AppColors.color424242),
                            ),
                          ),
                        ),
                        // Quantity with Border
                        Container(
                          height: 44.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              inventory[index]['quantity']!,
                              style: TextStyle(color: AppColors.color424242),
                            ),
                          ),
                        ),
                        // Delete Button (IconButton)
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              inventory.removeAt(index);
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
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: CustomTextField(
                      controller: quantityController,
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
