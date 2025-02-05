import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text.dart';
import 'package:thera_track_app/views/base/dotted_border_container.dart';

class CostAddScreen extends StatefulWidget {

  CostAddScreen({Key? key}) : super(key: key);

  @override
  State<CostAddScreen> createState() => _CostAddScreenState();
}

class _CostAddScreenState extends State<CostAddScreen> {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController foodController = TextEditingController();
  final TextEditingController gasController = TextEditingController();
  final TextEditingController otherController = TextEditingController();

  Uint8List? _image;
  File? selectedImage;

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
            _buildTextField('Departure', departureController),
            _buildTextField('Destination', destinationController),
            _buildTextField('Distance', distanceController),
            _buildTextField('Food', foodController),
            _buildTextField('Gas', gasController),
            _buildTextField('Other', otherController),
            SizedBox(height: 20.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                _image != null
                    ?  Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 16.w),
                      child: GestureDetector(
                      onTap: () {
                        showImagePickerOption(context);
                      },
                      child: DottedBorderContainer(
                        child: Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(width: 2.w, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(8.r),
                              image: DecorationImage(
                                  image: MemoryImage(_image!),
                                  fit: BoxFit.cover)),
                        )
                      ) ),
                    ):
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 16.w),
                  child: InkWell(
                    onTap: (){
                      showImagePickerOption(context);
                    },
                    child: DottedBorderContainer(
                        child: Container(
                          height: 200.h,
                          child: Center(
                              child: Text('Click to browse or \ndrag and drop your files',textAlign: TextAlign.center)),
                        )
                    ),
                  ),
                ),


              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(onTap: () {
              Get.toNamed(AppRoutes.costDetailsScreen);
            }, text: 'Save'),
          ]
        )
      )
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
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
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
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

  //==================================> ShowImagePickerOption Function <===============================
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColors.whiteColor,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 50.w,
                              color: AppColors.primaryColor,
                            ),
                            CustomText(text: 'Gallery')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt,
                                size: 50.w, color: AppColors.primaryColor),
                            CustomText(text: 'Camera')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //==================================> Gallery <===============================
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }

//==================================> Camera <===============================
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }
}
