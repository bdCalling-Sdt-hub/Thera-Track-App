import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';
import 'package:thera_track_app/views/base/dotted_border_container.dart';
import 'package:thera_track_app/views/screens/Home/chartArchive/innerWidget/addpoint_textBox.dart';

class CreateNewChartStepFourScreen extends StatefulWidget {
  @override
  _CreateNewChartStepFourScreenState createState() => _CreateNewChartStepFourScreenState();
}

class _CreateNewChartStepFourScreenState extends State<CreateNewChartStepFourScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController addNew = TextEditingController();
  TextEditingController addType = TextEditingController();

  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 4',style: AppStyles.fontSize16(),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Select the Area of Concern',style: AppStyles.fontSize18(fontWeight: FontWeight.w500)),
            Text('Select one or more areas. If unsure select Other.',style: AppStyles.fontSize14(color: AppColors.color424242)),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _image != null
                        ?   InkWell(
                      onTap: (){
                        showImagePickerOption(context);
                      },
                          child: DottedBorderContainer(
                          child: Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: 2.w, color: AppColors.whiteColor),
                                image: DecorationImage(
                                    image: MemoryImage(_image!),
                                    fit: BoxFit.cover)),
                          )
                                              ),
                        )
                        :   Padding(
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
              ),

              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(onTap: (){}, text: 'Cat')
                      ],
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(onTap: (){}, text: 'Add New')
                      ],
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(onTap: (){}, text: 'Add New')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(controller: addNew),
                  ),
                  SizedBox(width: 10.w), // Add spacing between the text field and button
                  SizedBox(
                    width: 120.w, // Set button width
                    child: CustomButton(onTap: () {}, text: 'Add'),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.w),
                      child: Text(
                          'Description',
                          style: AppStyles.fontSize18(color: AppColors.color575757)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: AppStyles.fontSize14(color: AppColors.color575757),
                              ),
                              Text(
                                '2. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: AppStyles.fontSize14(color: AppColors.color575757),
                              ),
                              Text(
                                '3. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: AppStyles.fontSize14(color: AppColors.color575757),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Recent Clients section
              SizedBox(height: 10.h),
              TextBoxList(),
              SizedBox(height: 10.h),
              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.createNewChartStepFiveScreen);
              }, text: 'Next'),
              SizedBox(height: 10.h),

            ],
          ),
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
