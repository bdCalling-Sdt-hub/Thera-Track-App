import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thera_track_app/controller/clientController/clientController.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
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
  final ClientController _clientController = Get.put(ClientController());

  Uint8List? _image;


  void _addAreaOfConcern() {
    if (_clientController.addController.text.isNotEmpty) {
      _clientController.areaOfConcernList.add(_clientController.addController.text);
      _clientController.addController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('Step 4', style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select the Area of Concern', style: AppStyles.fontSize18(fontWeight: FontWeight.w500)),
            Text('Select one or more areas. If unsure, select Other.', style: AppStyles.fontSize14(color: AppColors.greyColor)),

            SizedBox(height: 10.h),

            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _image != null
                      ? InkWell(
                    onTap: () => showImagePickerOption(context),
                    child: DottedBorderContainer(
                      child: Container(
                        height: 200.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: MemoryImage(_image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                      : Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    child: InkWell(
                      onTap: () => showImagePickerOption(context),
                      child: DottedBorderContainer(
                        child: Container(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              'Click to browse or \ndrag and drop your files',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // Grid for Area of Concern Selection
            Container(
              child: Obx(() => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 2,
                ),
                itemCount: _clientController.areaOfConcernList.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    String currentItem = _clientController.areaOfConcernList[index];
                    bool isSelected = _clientController.selectedAreaOfConcern.contains(currentItem);

                    return GestureDetector(
                      onTap: () {
                        if (isSelected) {
                          _clientController.selectedAreaOfConcern.remove(currentItem);
                        } else {
                          _clientController.selectedAreaOfConcern.add(currentItem);
                        }
                        print('Selected Items: ${_clientController.selectedAreaOfConcern.map((item) => '"$item"').toList()}');

                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.greyColor, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            currentItem,
                            style: AppStyles.fontSize16(
                              color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                },
              )),
            ),


            SizedBox(height: 10.h),

            // Add New Area of Concern
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                children: [
                  Expanded(flex: 2, child: CustomTextField(controller: _clientController.addController)),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 60.h,
                    width: 80.w,
                    child: CustomButton(onTap: _addAreaOfConcern, text: 'Add'),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // Description Box
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
                    child: Text('Description', style: AppStyles.fontSize18(color: AppColors.color575757)),
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
                        TextFormField(
                          controller: _clientController.descriptionTextController,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(500),
                          ],
                          decoration: InputDecoration(
                            hintText: "Enter text...",
                            border: InputBorder.none, // Removes borderR
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // Recent Clients Section
            TextBoxList(),

            SizedBox(height: 10.h),

            // Next Button
            CustomButton(onTap: () => Get.toNamed(AppRoutes.createNewChartStepFiveScreen), text: 'Next'),

            SizedBox(height: 10.h),
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
      _clientController.selectedImage = File(returnImage.path);
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
      _clientController.selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }
}
