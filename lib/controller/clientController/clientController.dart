import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/prefs_helpers.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/service/api_checker.dart';
import 'package:thera_track_app/service/api_client.dart';
import 'package:thera_track_app/service/api_constants.dart';
import 'package:thera_track_app/utils/app_constants.dart';

class AddClientController extends GetxController{

//============= Add Client ==========================
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController zipCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController otherCtrl = TextEditingController();

  var addClientLoading = false.obs;

  addClient() async {
    addClientLoading(true);
    Map<String, dynamic> body = {
      'name': nameCtrl.text.trim(),
      "address": {
        "city": cityCtrl.text.trim(),
        "state": stateCtrl.text.trim(),
        "zip": zipCtrl.text.trim(),
      },
      'phoneNumber': phoneNumberCtrl.text.trim(),
      'email': emailCtrl.text.trim(),
      'other': otherCtrl.text.trim(),
    };

    var bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    print("====> API Request Body: ${jsonEncode(body)}");

    var response = await ApiClient.postData(ApiConstants.createHumanClientEndPoint, headers :headers, jsonEncode(body),);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar("Successfully", "New Client Added!");
      Get.toNamed(AppRoutes.createNewChartStepOneScreen);
      addClientLoading(false);
    } else {
      ApiChecker.checkApi(response);
      Get.snackbar("Error", "Something is wrong.");
      addClientLoading(false);
    }
  }

  void clearValues() {
    nameCtrl.clear();
    cityCtrl.clear();
    stateCtrl.clear();
    zipCtrl.clear();
    phoneNumberCtrl.clear();
    otherCtrl.clear();
    update();
  }
}

