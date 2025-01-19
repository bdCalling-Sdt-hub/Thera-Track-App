import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/app_images.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameCTRL = TextEditingController();
  final TextEditingController emailCTRl = TextEditingController();
  final TextEditingController phoneNumberCTRL = TextEditingController();
  final TextEditingController passwordCTRL = TextEditingController(); // Fixed naming
  final TextEditingController confirmPasswordCTRL = TextEditingController(); // Fixed naming
  String selectedCountryCode = '+880';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.appLogo, width: 72.w, height: 72.h),
                  SizedBox(height: 20.h),
                  Text(AppStrings.signupToYourAccount,
                    style: AppStyles.fontSize24(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20.h),
                  Text(AppStrings.welcomeBack,
                    style: AppStyles.fontSize14(fontWeight: FontWeight.w400,color: AppColors.color878787),
                  ),
                  SizedBox(height: 30.h),

                  // User Name
                  Text(AppStrings.nameText, style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: userNameCTRL,
                    hintText: AppStrings.enterName,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: SvgPicture.asset(AppIcons.personIcon),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name"; // Corrected message
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.h),

                  // Email
                  Text(AppStrings.email, style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: emailCTRl,
                    hintText: AppStrings.enterEmail,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: SvgPicture.asset(AppIcons.emailIcon),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.h),

                  // Phone Number
                  Text(AppStrings.phoneNumber, style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
                  SizedBox(height: 8.h),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      hintText: "Enter Phone name",
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
                  SizedBox(height: 8.h),
                  // Password
                  Text(AppStrings.passwordText, style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: passwordCTRL,
                    hintText: AppStrings.enterPassword,
                    isPassword: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: SvgPicture.asset(AppIcons.passwordLockIcon),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.h),

                  // Confirm Password
                  Text(AppStrings.confirmPasswordText, style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: confirmPasswordCTRL,
                    hintText: AppStrings.enterConfirmPassword,
                    isPassword: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: SvgPicture.asset(AppIcons.passwordLockIcon),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password again";
                      }
                      if (value != passwordCTRL.text) { // Ensure passwords match
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  _checkboxSection(),
                  // Sign Up Button
                  SizedBox(height: 20.h),
                  CustomButton(
                    textColor: AppColors.textColor,
                    onTap: () {
                    //  Get.toNamed(AppRoutes.signInScreen);
                    },
                    text: AppStrings.signUp,
                  ),

                  // Don't Have an Account Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.alreadyHaveAnAccount, style: AppStyles.fontSize14()),
                      TextButton(
                        onPressed: () {
                           Get.toNamed(AppRoutes.signInScreen);
                        },
                        child: CustomText(
                          text: AppStrings.signIn,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
  //==========================> Checkbox Section Widget <=======================
  _checkboxSection() {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: AppColors.primaryColor,
          focusColor: AppColors.greyColor,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          side: BorderSide(
            color: isChecked ? AppColors.primaryColor : AppColors.primaryColor,
            width: 1.w,
          ),
        ),
        Text.rich(
          maxLines: 2,
          TextSpan(
            text: AppStrings.byCreating,
            style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w500,color: AppColors.color878787),
            children: [
              TextSpan(
                text: AppStrings.termsConditions,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.w,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                   // Get.toNamed(AppRoutes.termsConditionScreen);
                  },
              ),
              const TextSpan(text: ' & '),
              TextSpan(
                text: AppStrings.privacyPolicy,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.w,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                   // Get.toNamed(AppRoutes.privacyPolicyScreen);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
