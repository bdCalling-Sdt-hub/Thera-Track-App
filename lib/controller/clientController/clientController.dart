import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:thera_track_app/helpers/prefs_helpers.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/models/clients/all_clients_model.dart';
import 'package:thera_track_app/service/api_checker.dart';
import 'package:thera_track_app/service/api_client.dart';
import 'package:thera_track_app/service/api_constants.dart';
import 'package:thera_track_app/utils/app_constants.dart';

class ClientController extends GetxController {

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

    var response = await ApiClient.postData(
      ApiConstants.createHumanClientEndPoint, headers: headers,
      jsonEncode(body),);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar("Successfully", "New Client Added!");
      Get.toNamed(AppRoutes.createNewChartStepOneScreen);
      addClientLoading(false);
      clearValues();
    } else {
      ApiChecker.checkApi(response);
      Get.snackbar("Error", '${response.body['message']}');
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
    emailCtrl.clear();
    update();
  }

  //=========================>> All Client Info <<============================

  RxList<GetClientInfoModel> getClientInfoModel = <GetClientInfoModel>[].obs;
  var loading = false.obs;

  getAllClientInfo() async {
    loading(true);

    var response = await ApiClient.getData(
        "${ApiConstants.grtAllClientDataEndPoint}");
    if (response.statusCode == 200) {
      getClientInfoModel.value = List.from(
          response.body['data']['attributes'].map((x) => GetClientInfoModel.fromJson(x)));
      loading(false);
      update();
    }
    else {
      ApiChecker.checkApi(response);
      loading(false);
      update();
    }
  }

  //=========================>> Client Animal <<============================

  RxList<String> animalList=<String>[].obs;

  clientAnimalList() async {
    loading(true);

    var response = await ApiClient.getData(
        "${ApiConstants.clientAnimalEndPoint}");
    if (response.statusCode == 200) {
var animals=response.body['data']['attributes'];


      for(var x in animals ){
        animalList.add(x);
      }



      Logger log=Logger();
      log.i("animal list is==================> ${animalList.length}");

      loading(false);
      update();
    }
    else {
      ApiChecker.checkApi(response);
      loading(false);
      update();
    }
  }
}

