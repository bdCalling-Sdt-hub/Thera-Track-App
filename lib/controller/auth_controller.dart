import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/service/api_checker.dart';
import 'package:thera_track_app/service/api_client.dart';
import '../service/api_constants.dart';

class AuthController extends GetxController {

  ///<=============================== Sign Up Method ===========================>
  final TextEditingController userNameCTRL = TextEditingController();
  final TextEditingController signUpEmailCtrl = TextEditingController();
  final TextEditingController phoneNumberCTRL = TextEditingController();
  final TextEditingController passwordCTRL = TextEditingController();
  final TextEditingController confirmPasswordCTRL = TextEditingController();

  var signUpLoading = false.obs;

  String selectedCountryCodes = '+880';
  String role = 'admin';

   signUpMethod() async {
     signUpLoading.value = true;
    // var fcmToken = await PrefsHelper.getString(AppConstants.fcmToken);

     String phoneNumber = phoneNumberCTRL.text.trim();
     String countryCode = selectedCountryCodes;

     Map<String, dynamic> body = {
       "firstName": userNameCTRL.text.trim(),
       "email": signUpEmailCtrl.text.trim(),
       "phoneNumber": countryCode + phoneNumber,
       "password": passwordCTRL.text.trim(),
       "ConfirmPassword": confirmPasswordCTRL.text.trim(),
       "role": role,
     };

     var headers = {
       'Accept': 'application/json',
       'Content-Type': 'application/json'
     };
     var response = await ApiClient.postData(
       ApiConstants.signUpEndPoint, jsonEncode(body),headers: headers
     );

     if(response.statusCode==200){
       Get.toNamed(AppRoutes.verifyScreen, parameters: {
         "email": signUpEmailCtrl.text.trim(),
         "screenType": "signupScreen",
       },
       );
        signUpLoading(false);
       update();
     }
     else{
       ApiChecker.checkApi(response);
       signUpLoading(false);
       update();
     }
   }
///===========================>> Sign In <<===============================

  final TextEditingController signInEmailCtrl = TextEditingController();
  final TextEditingController signInPasswordCtrl = TextEditingController();

  var signInLoading = false.obs;

  signInMethod() async {
    signInLoading(true);
    //  var fcmToken = await PrefsHelper.getString(AppConstants.fcmToken);
    var headers = {
      'Content-Type': 'application/json'
    };

    Map<String, dynamic> body = {
      "email": signInEmailCtrl.text.trim(),
      "password": signInPasswordCtrl.text.trim(),
      //"fcmToken": fcmToken,
    };

    print("===================> $body");

    Response response = await ApiClient.postData(
      ApiConstants.signInEndPoint,
      jsonEncode(body),
      headers: headers,
    );

    print("============> Response Body: ${response.body}, Status Code: ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      signInLoading(false);
      Get.offAllNamed(AppRoutes.homeScreen);
      Get.snackbar('Successfully', 'Logged In');
    } else {

      ApiChecker.checkApi(response);
      print("=============================> Server Down");
      Get.snackbar('Error', response.body['message']);
      signInLoading(false);
    }
  }





  ///<=================================== verifyOTP Method==================================================>
  var verifyOTPLoading = false.obs;
  TextEditingController verifyCodeCtrl = TextEditingController();
  verifyCode({
    required String email,
    required String code,
    required String type,
  }) async {
    verifyOTPLoading(true);
    try {
      Map<String, dynamic> body = {
        "email": email,
        "oneTimeCode": code};
      print("===================> ${body}");
      var headers = {'Content-Type': 'application/json'};

      Response response = await ApiClient.postData(
          ApiConstants.otpVerifyEndPoint, jsonEncode(body),
          headers: headers);

      print("============> Response Body ${response.body} and ==> ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Verified','Successfully');
        if (type == "signupScreen") {
          Get.offAllNamed(AppRoutes.signInScreen);
        } else if(type == "forgetPasswordScreen") {
        //  Get.offAllNamed(AppRoutes.setPasswordScreen);
        }

      } else if (response.statusCode == 400 || response.statusCode == 401) {
        Get.snackbar('Error', 'Invalid Code');
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      print("===> error : $e");
    }
    verifyOTPLoading(false);
  }


/*
  signInMethod() async {
    signInLoading(true);
    var fcmToken = await PrefsHelper.getString(AppConstants.fcmToken);
    var headers = {
      'Content-Type': 'application/json'
    };

    Map<String, dynamic> body = {
      "email": signInEmailCtrl.text.trim(),
      "password": passCtrl.text.trim(),
      "fcmToken": fcmToken,
      //"fcmToken": fcmToken,
    };

    print("===================> $body");

    try {
      Response response = await ApiClient.postData(
        ApiConstants.signInEndPoint,
        body,
        headers: headers,
      );

      print("============> Response Body: ${response.body}, Status Code: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Hera is your fcmToken : $fcmToken');
        PrefsHelper.setString(AppConstants.bearerToken, response.body['data']['token']);

        String userRole = response.body['data']['attributes']['role'];
        String userID = response.body['data']['attributes']['_id'];
        await PrefsHelper.setString(AppConstants.role, userRole);

        await PrefsHelper.setString(AppConstants.userId, userID);


        await PrefsHelper.setBool(AppConstants.isLogged, true);
        print('===================>> User Role: $userRole');

        if (userRole == Role.user.name) {
          Get.offAllNamed(AppRoutes.userHomeScreen);
          Get.snackbar('Successfully', 'Logged in as User');
        } else if (userRole == Role.driver.name) {
          Get.offAllNamed(AppRoutes.driverHomeScreen);
          Get.snackbar('Successfully', 'Logged in as Driver');
        } else if (userRole == Role.agency.name) {
          Get.offAllNamed(AppRoutes.agencyHomeScreen);
          Get.snackbar('Successfully', 'Logged in as Agency');
        } else {
          Get.snackbar('Error', 'Invalid Role');
        }
      }
      if ( response.statusCode == 401) {
        Get.snackbar('Error', response.body['message']);
      }
      if (response.statusCode == 404) {
        Get.snackbar('Error', response.body['message']);
      }
      else {
        ApiChecker.checkApi(response);
        print("=============================> Server Down");
      }
    } catch (e) {
      signInLoading(false);
      Get.snackbar('Error', 'An unexpected error occurred');
      print('Error: $e');
    } finally {
      signInLoading(false);
    }
  }
*/


/*
  ///<=================================== verifyOTP Method==================================================>
  var verifyOTPLoading = false.obs;
  TextEditingController verifyCodeCtrl = TextEditingController();
  verifyCode({
    required String email,
    required String code,
    required String type,
  }) async {
    verifyOTPLoading(true);
    try {
      Map<String, dynamic> body = {
        "email": email,
        "code": code};
      print("===================> ${body}");
      var headers = {'Content-Type': 'application/json'};

      Response response = await ApiClient.postData(
          ApiConstants.verifyCodeEndPoint, body,
          headers: headers);

      print("============> Response Body ${response.body} and ==> ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        PrefsHelper.setString(AppConstants.bearerToken, response.body['data']['token']);
        PrefsHelper.setString(AppConstants.role, response.body['data']['attributes']['role']);
        Get.snackbar(AppStrings.verifiedText.tr, AppStrings.successfulText.tr);


        if (type == "signupScreen") {
          Get.offAllNamed(AppRoutes.setLocationScreen);
        } else if(type == "forgetPasswordScreen") {
          Get.offAllNamed(AppRoutes.setPasswordScreen);
        }

      } else if (response.statusCode == 400 || response.statusCode == 401) {
        Get.snackbar(AppStrings.errorTextSpecial.tr, AppStrings.invalidCodeText.tr);
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      print("===> error : $e");
    }
    verifyOTPLoading(false);
  }


  ///==================>>  Forgot pass word   <<<===============
  TextEditingController forgetEmailTextCtrl = TextEditingController();

  var forgotLoading = false.obs;

  handleForget() async {
    forgotLoading(true);
    var body = {
      "email": forgetEmailTextCtrl.text.trim(),
    };
    var headers = {
      'Content-Type': 'application/json'
    };
    var response = await ApiClient.postData(
        ApiConstants.forgotPasswordEndPoint,
        body,
        headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.toNamed(AppRoutes.verifyCodeScreen, parameters: {
        "email": forgetEmailTextCtrl.text.trim(),
        "screenType": "forgetPasswordScreen",
      });
      Get.snackbar(AppStrings.successfulText.tr, 'OTP Send your email');
    }
    if (response.statusCode == 404) {
      Get.snackbar(AppStrings.errorTextSpecial.tr, AppStrings.someThingWrong.tr);
    }

    else {
      ApiChecker.checkApi(response);

    }
    forgotLoading(false);
  }

  /// ==========================>> Resend otp   <<================
  var resendOtpLoading = false.obs;
  resendOtp(String email) async {
    resendOtpLoading(true);
    var body = {
      "email": email,
    };
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstants.resendOTPEndPoint, body,
        headers: header);
    print("===> ${response.body}");
    if (response.statusCode == 200) {
      Get.snackbar(AppStrings.successfulText.tr, 'Resend OTP Send your email');
    } else {
      Get.snackbar(AppStrings.errorTextSpecial.tr, 'Something Wrong');
    }
    resendOtpLoading(false);
  }
  //====================================> Set New password <==================================
  var setPasswordLoading = false.obs;
  final TextEditingController setNewPasswordCTRl = TextEditingController();
  final TextEditingController setConfirmNewPasswordCTRl = TextEditingController();

  setNewPassword(String password) async {
    setPasswordLoading(true);
    var body = {"password": password};
    var response =
    await ApiClient.postData(ApiConstants.setNewPasswordEndPoint, body);
    if (response.statusCode == 200) {
      Get.snackbar(AppStrings.successfulText.tr, AppStrings.setNewPassword.tr);
      Get.offNamed(AppRoutes.greatFullScreen);
    } else {
     Get.snackbar('Error', 'Error Set New password');
    }
    setPasswordLoading(false);
  }


  //====================================> Change password <==================================

  final TextEditingController currentPasswordCTRl = TextEditingController();
  final TextEditingController newPassCTRl = TextEditingController();
  final TextEditingController confirmPassCTRl = TextEditingController();
  var changeLoading = false.obs;

  changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    changeLoading(true);

    var body = {
      "oldPassword": oldPassword,
      "newPassword": newPassword
    };
    var bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $bearerToken'
    };

    var response = await ApiClient.patchData(
        ApiConstants.changePasswordEndPoint,
        body: body,
        headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar(AppStrings.successfulText.tr, AppStrings.passwordChanged.tr);
      Get.offAllNamed(AppRoutes.greatFullScreen);
    }  if (response.statusCode == 400) {
      Get.snackbar(AppStrings.errorTextSpecial.tr, 'Old Password Incorrect');
    }
    else {
      ApiChecker.checkApi(response);
      debugPrint("error set password ${response.statusText}");
    }
    changeLoading(false);
  }
*/

}


