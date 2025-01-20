
import 'package:get/get.dart';
import 'package:thera_track_app/views/screens/Auth/SignIn/sign_in_screen.dart';
import 'package:thera_track_app/views/screens/Auth/SignUp/sign_up_screen.dart';
import 'package:thera_track_app/views/screens/Auth/Verification/verify_screen.dart';
import 'package:thera_track_app/views/screens/Auth/forgotPassword/forgotPassword_screen.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/createNew_chart_stepOne.dart';
import 'package:thera_track_app/views/screens/Home/home_screen.dart';
import 'package:thera_track_app/views/screens/Splash/onboarding_screen.dart';
import 'package:thera_track_app/views/screens/Splash/splash_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/AccountSetUp/accountSetUp_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/advance_setting/advance_settings_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/treatment/treatment_screen.dart';
import '../views/screens/appDrawer/yourDetails/yourDetails_screen.dart';

class AppRoutes{
  static String splashScreen="/splash_screen";
  static String onboardingScreen="/OnboardingScreen";
  static String signInScreen="/signInScreen";
  static String signUpScreen="/signUpScreen";
  static String forgotPasswordScreen="/ForgotPasswordScreen";
  static String verifyScreen="/verifyScreen";
  static String homeScreen="/homeScreen";
  static String accountSetUpScreen="/accountSetUpScreen";
  static String yourDetailsScreen="/yourDetailsScreen";
  static String treatmentScreen="/treatmentScreen";
  static String advanceSettingsScreen="/advanceSettingsScreen";
  static String createNewChartStepOneScreen="/createNewChartStepOneScreen";


 static List<GetPage> page=[

   //Auth part
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:onboardingScreen, page: ()=>const OnboardingScreen()),

    GetPage(name:signInScreen, page: ()=>const SignInScreen()),
    GetPage(name:signUpScreen, page: ()=>const SignUpScreen()),
    GetPage(name:forgotPasswordScreen, page: ()=>const ForgotPasswordScreen()),
    GetPage(name:verifyScreen, page: ()=>const VerifyScreen()),


   //Home
   GetPage(name:homeScreen, page: ()=> HomeScreen(),transition: Transition.noTransition),
   GetPage(name:accountSetUpScreen, page: ()=> AccountSetUpScreen(),transition: Transition.noTransition),
   GetPage(name:yourDetailsScreen, page: ()=> YourDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:treatmentScreen, page: ()=> TreatmentScreen(),transition: Transition.noTransition),
   GetPage(name:advanceSettingsScreen, page: ()=> AdvanceSettingsScreen(),transition: Transition.noTransition),
   GetPage(name:createNewChartStepOneScreen, page: ()=> CreateNewChartStepOneScreen(),transition: Transition.noTransition),


  ];
}