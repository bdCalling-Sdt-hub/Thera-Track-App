import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:thera_track_app/controller/profileController.dart';
import 'package:thera_track_app/service/api_constants.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_images.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_page_loading.dart';
import 'package:thera_track_app/views/base/custom_text.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';

class AccountSetUpScreen extends StatefulWidget {
  const AccountSetUpScreen({super.key});

  @override
  State<AccountSetUpScreen> createState() => _AccountSetUpScreenState();
}

class _AccountSetUpScreenState extends State<AccountSetUpScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  Uint8List? _image;
  File? selectedImage;
  TextEditingController nameCTRl = TextEditingController();
  TextEditingController cityCTRl = TextEditingController();
  TextEditingController postCodeCTRl = TextEditingController();
  TextEditingController countryCTRl = TextEditingController();
  TextEditingController phoneNumberCTRl = TextEditingController();
  TextEditingController emailCTRl = TextEditingController();

  @override
  void initState() {
    super.initState();
    var profileData = profileController.profileInformationModel.value;
    nameCTRl.text = profileData.fullName ?? '';
    cityCTRl.text = profileData.city ?? '';
    postCodeCTRl.text = profileData.postCode ?? '';
    countryCTRl.text = profileData.country ?? '';
    phoneNumberCTRl.text = profileData.phoneNumber ?? '';
    emailCTRl.text = profileData.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text('Account Setup', style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: Obx(() {
        var profileData = profileController.profileInformationModel.value;
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture and Name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children:  [
                            _image != null
                                ? CircleAvatar(radius: 60.r, backgroundImage: MemoryImage(_image!))
                                : Container(
                              clipBehavior: Clip.antiAlias,
                              height: 100.h,
                              width: 100.w,
                              decoration: const BoxDecoration(shape: BoxShape.circle),
                              child: profileData?.profileImage == null || profileData?.profileImage == ''
                                  ? const Center(child: CustomPageLoading())
                                  : CachedNetworkImage(
                                imageUrl: "${ApiConstants.imageBaseUrl}/${profileData?.profileImage}",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CustomPageLoading(),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.h,
                              right: 0.w,
                              child: GestureDetector(
                                onTap: () {
                                  showImagePickerOption(context);
                                },
                                child: Image.asset(AppImages.appLogo, width: 30.w, height: 29.h),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Darlene Robertson',
                          style: AppStyles.fontSize16(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Full Name
                Text(AppStrings.nameText, style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: nameCTRl,
                  hintText: AppStrings.fullName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your full name";
                    }
                    return null;
                  },
                ),
                // Town/City
                SizedBox(height: 8.h),
                Text('Town/City', style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: cityCTRl,
                  hintText: 'Enter your Town/City',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Town/City";
                    }
                    return null;
                  },
                ),
                // Postcode
                SizedBox(height: 8.h),
                Text('Postcode', style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: postCodeCTRl,
                  hintText: 'Enter your postcode',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Postcode";
                    }
                    return null;
                  },
                ),
                // Country
                SizedBox(height: 8.h),
                Text('Country', style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: countryCTRl,
                  hintText: 'Enter your Country',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Country";
                    }
                    return null;
                  },
                ),
                // Mobile
                SizedBox(height: 8.h),
                Text('Mobile', style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.color424242)),
                SizedBox(height: 8.h),
                IntlPhoneField(
                  decoration: InputDecoration(
                    hintText: AppStrings.enterPhoneNumber,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
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
                Text('Main Email Address', style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomTextField(
                  onTab: () {
                    Get.snackbar('Wrong !!', 'You Can\'t Edit your Email.');
                  },
                  readOnly: true,
                  controller: emailCTRl,
                  hintText: 'Enter Your email',
                ),
                SizedBox(height: 50.h),
                CustomButton(
                  onTap: () {
                    profileController.editProfile(
                      image: selectedImage,
                      fullName: nameCTRl.text,
                      city: cityCTRl.text,
                      postCode: postCodeCTRl.text,
                      country: countryCTRl.text,
                      phoneNumber: phoneNumberCTRl.text,
                    );
                  },
                  text: 'Save',
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // Show Image Picker Option
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
                          CustomText(text: 'Gallery'),
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
                          Icon(Icons.camera_alt, size: 50.w, color: AppColors.primaryColor),
                          CustomText(text: 'Camera'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Pick Image From Gallery
  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }

  // Pick Image From Camera
  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }
}