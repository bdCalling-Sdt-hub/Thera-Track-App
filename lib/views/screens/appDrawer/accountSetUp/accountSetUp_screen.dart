import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:thera_track_app/controller/accountSetup_controller.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';

class AccountSetUpScreen extends StatefulWidget {
  const AccountSetUpScreen({super.key});

  @override
  State<AccountSetUpScreen> createState() =>
      _AccountSetUpScreenState();
}

class _AccountSetUpScreenState extends State<AccountSetUpScreen> {

  final AccountSetUpController accountSetUpController = Get.put(AccountSetUpController());

  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('Account Setup',style:AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.h,vertical: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Full Name
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Profile picture
                          _image != null
                              ? Padding(
                            padding:  EdgeInsets.all(8.0.r),
                            child: InkWell(
                              onTap: (){
                                showImagePickerOption(context);
                              },
                              child: Container(
                                  width: 100.w,height: 100.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                      border: Border.all(width: 1.w, color: AppColors.whiteColor),
                                      image: DecorationImage(
                                          image: MemoryImage(_image!),
                                          fit: BoxFit.cover))),
                            ),
                          ) : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100.w,height: 100.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  'https://t3.ftcdn.net/jpg/02/43/12/34/240_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 50,
                            child: GestureDetector(
                              onTap: () {
                               showImagePickerOption(context);
                              },
                              child: Icon(Icons.image_outlined,size: 25,color: AppColors.whiteColor,),
                            ),
                          ),

                        ],
                      ),
                      Text('Darlene Robertson',style: AppStyles.fontSize16(fontWeight:FontWeight.w400),),
                    ],

                  ),
                ],
              ),
              Text(AppStrings.nameText,style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: accountSetUpController.fullNameCTRl,
                hintText: AppStrings.fullName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),
              //Email
              SizedBox(height: 8.h),
              Text('Town/City',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: accountSetUpController.townCTRl,
                hintText: 'Enter your Town/City',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Town/City";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),
              ///====================>>> PostCode
              Text('Postcode',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: accountSetUpController.postCodeCTRl,
                hintText: 'Enter your postcode',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Postcode";
                  }
                  return null;
                },
              ),

              SizedBox(height: 8.h),

              ///====================>>> Country
              Text('Country',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: accountSetUpController.countryCTRl,
                hintText: 'Enter your Country',

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Country";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),

              Text('Mobile', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              IntlPhoneField(
                decoration: InputDecoration(
                  hintText: AppStrings.enterPhoneNumber,
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
                  ),
                ),
                showCountryFlag: true,
                initialCountryCode: 'US',
                flagsButtonMargin: EdgeInsets.only(left: 10.w),
                disableLengthCheck: true,
                dropdownIconPosition: IconPosition.trailing,
                onChanged: (phone) {
                  print("Phone===============> ${phone.completeNumber}");
                },
              ),

              // Main Email Address
              SizedBox(height: 8.h),
              Text('Main Email Address',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller:accountSetUpController.emailCTRl,
                hintText: 'Enter Your email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),

              SizedBox(height: 50.h),
              CustomButton(
                  onTap: (){},
                  text: 'Save')
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
