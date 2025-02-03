

import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/models/profile/profile_model.dart';
import 'package:thera_track_app/service/api_checker.dart';
import 'package:thera_track_app/service/api_client.dart';
import 'package:thera_track_app/service/api_constants.dart';

class ProfileController extends GetxController  implements GetxService{

//============================> Get Profile Data <=============================

  Rx<ProfileInformationModel> profileInformationModel = ProfileInformationModel().obs;
  var isLoading = false.obs;

  getProfileData() async {
    isLoading(true);
    var response = await ApiClient.getData(
      ApiConstants.getProfileDataEndPoint,
    );
    print("=============response : ${response.body}");
    if (response.statusCode == 200) {
      profileInformationModel.value = ProfileInformationModel.fromJson(response.body['data']['attributes']);
      isLoading(false);
      update();
    }
    else{
      ApiChecker.checkApi(response);
      isLoading(false);
      update();
    }

  }

  ///======================edit/update profile============================>

  editProfile({
    required File? image,
    required String fullName,
    required city ,
    required postCode,
    required country,
    required phoneNumber,
  }) async {

    List<MultipartBody> multipartBody = image == null ? [] : [MultipartBody("profileImage", image)];

    Map<String, String> body = {
      "fullName": fullName,
      "city": city,
      "postCode": postCode,
      "country": country,
      "phoneNumber": phoneNumber,
    };

    var response = await ApiClient.patchMultipartData(
      ApiConstants.editProfileEndPoint,
      body,
      multipartBody: multipartBody,
    );
    print("Endpoint URL >>>>>>>>>>>>>>>>>>>>>>: ${ApiConstants.editProfileEndPoint}");

    print("===========response body : ${response.body} \nand status code : ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      profileInformationModel.value = ProfileInformationModel.fromJson(response.body['data']['attributes']);
      profileInformationModel.refresh();
        Get.offAllNamed(AppRoutes.homeScreen);
        Get.snackbar('Successfully', 'Profile Updated');
    } else {
      ApiChecker.checkApi(response);
    }
   {

    }}

}