import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/prefs_helpers.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:thera_track_app/utils/app_images.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/views/base/custom_button.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    StreamSubscription;
  //  getConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.appLogo,
                height: 130.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 80.h),
              CustomButton(
                textColor: AppColors.textColor,
                onTap: () {
                   Get.toNamed(AppRoutes.signInScreen);
                },
                text: 'Get Started',
              ),
            ],
          ),
        ),
      ),
    );
  }


  ///===================internet connection checker==================>
  StreamSubscription? streamSubscription;
  bool isConnection = false;

  ///========================is internet connection check========================>
/*  void getConnectivity() {
    streamSubscription =
        Connectivity().onConnectivityChanged.listen((event) async {
    //  isConnection = await InternetConnectionChecker().hasConnection;

      ///==================if internet is available===================>
      if (isConnection) {
        print("------------------Internet available");
        Timer(const Duration(seconds: 4), () async {
          bool? isLogged = await PrefsHelper.getBool(AppConstants.isLogged);
          String token = await PrefsHelper.getString(AppConstants.bearerToken);
          var role = await PrefsHelper.getString(AppConstants.role);

          ///========================check islogged in, token, and role then decide where will be navigate====================>

          if (isLogged != null && isLogged) {
            if (token.isNotEmpty) {
              if (role == "user") {
              //  Get.offAllNamed(AppRoutes.homeScreen);
              }
              if (role == "employee") {
             //   Get.offAllNamed(AppRoutes.deliveryHomeScreen);
              }
            }
          } else {
          //  Get.offAllNamed(AppRoutes.onboardingScreen);
          }
        });
      }

      ///======================no internet=========================>
      else {
       // Get.snack bar('Network Error!', 'Please connect your internet.');
       // AppCustomToast.showCustomToast('Please connect your internet.');
        print("----------------------No internet");
      }
    });
  }*/
}
