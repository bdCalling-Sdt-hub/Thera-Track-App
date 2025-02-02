import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';
import 'package:thera_track_app/views/base/dotted_border_container.dart';

class CostAddScreen extends StatelessWidget {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController foodController = TextEditingController();
  final TextEditingController gasController = TextEditingController();
  final TextEditingController otherController = TextEditingController();

  CostAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cost', style: AppStyles.fontSize16()),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: [
            _buildTextField('Departure', 'Starting place name', departureController),
            _buildTextField('Destination', 'Place name', destinationController),
            _buildTextField('Distance', '00 Km', distanceController),
            _buildTextField('Food', '00\$', foodController),
            _buildTextField('Gas', '00\$', gasController),
            _buildTextField('Other', '00\$', otherController),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                // Handle file picker action
              },
              child: DottedBorderContainer(
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Click to browse or\ndrag and drop your files',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(onTap: () {}, text: 'Save'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: Container(
        height: 50.h,
        color: Colors.blue.shade100,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(12.r),
                color: Colors.blue.shade100,
                child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: placeholder,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // White border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // White border when not focused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2), // White border when focused
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
