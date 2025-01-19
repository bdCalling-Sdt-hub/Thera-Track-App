
import 'package:get/get.dart';
import 'package:thera_track_app/views/screens/Auth/SignIn/sign_in_screen.dart';
import 'package:thera_track_app/views/screens/Auth/SignUp/sign_up_screen.dart';
import 'package:thera_track_app/views/screens/Auth/Verification/verify_screen.dart';
import 'package:thera_track_app/views/screens/Auth/forgotPassword/forgotPassword_screen.dart';
import 'package:thera_track_app/views/screens/Splash/onboarding_screen.dart';
import 'package:thera_track_app/views/screens/Splash/splash_screen.dart';

class AppRoutes{
  static String splashScreen="/splash_screen";
  static String onboardingScreen="/OnboardingScreen";
  static String signInScreen="/signInScreen";
  static String signUpScreen="/signUpScreen";
  static String forgotPasswordScreen="/ForgotPasswordScreen";
  static String verifyScreen="/verifyScreen";


 static List<GetPage> page=[

   //Auth part
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:onboardingScreen, page: ()=>const OnboardingScreen()),

    GetPage(name:signInScreen, page: ()=>const SignInScreen()),
    GetPage(name:signUpScreen, page: ()=>const SignUpScreen()),
    GetPage(name:forgotPasswordScreen, page: ()=>const ForgotPasswordScreen()),
    GetPage(name:verifyScreen, page: ()=>const VerifyScreen()),


  ];
}