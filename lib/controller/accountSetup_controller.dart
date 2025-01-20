import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AccountSetUpController extends GetxController  implements GetxService{

  final TextEditingController fullNameCTRl = TextEditingController();
  final TextEditingController townCTRl = TextEditingController();
  final TextEditingController postCodeCTRl = TextEditingController();
  final TextEditingController countryCTRl = TextEditingController();
  final TextEditingController emailCTRl = TextEditingController();

}