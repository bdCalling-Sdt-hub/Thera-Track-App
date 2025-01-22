
import 'package:get/get.dart';
import 'package:thera_track_app/views/screens/Auth/SignIn/sign_in_screen.dart';
import 'package:thera_track_app/views/screens/Auth/SignUp/sign_up_screen.dart';
import 'package:thera_track_app/views/screens/Auth/Verification/verify_screen.dart';
import 'package:thera_track_app/views/screens/Auth/forgotPassword/forgotPassword_screen.dart';
import 'package:thera_track_app/views/screens/Home/appointment/appointment_screen.dart';
import 'package:thera_track_app/views/screens/Home/chartArchive/chartArchive_screen.dart';
import 'package:thera_track_app/views/screens/Home/chartArchive/detailsChartArchive_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/contact_details_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/contact_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/contact_search_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/edit_contact_details_screen.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/animalStep/createNew_chart_stepOne.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/animalStep/createNew_chart_stepThree.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/animalStep/createNew_chart_stepTwo.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/animalStep/horseDetailsScreen.dart';
import 'package:thera_track_app/views/screens/Home/home_screen.dart';
import 'package:thera_track_app/views/screens/Home/offline_file/offline_file_screen.dart';
import 'package:thera_track_app/views/screens/Splash/onboarding_screen.dart';
import 'package:thera_track_app/views/screens/Splash/splash_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/AccountSetUp/accountSetUp_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/advance_setting/advance_settings_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/feedback/feedback_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/paid/paidDetails_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/treatment/treatment_screen.dart';
import 'package:thera_track_app/views/screens/appDrawer/unpaid/undPaidDetails_screen.dart';
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
  static String paidDetailsScreen="/paidDetailsScreen";
  static String unPaidDetailsScreen="/unPaidDetailsScreen";
  static String feedbackScreen="/feedbackScreen";
  static String createNewChartStepTwoScreen="/createNewChartStepTwoScreen";
  static String createNewChartStepThreeScreen="/createNewChartStepThreeScreen";
  static String horseDetailsScreen="/horseDetailsScreen";
  static String chartArchiveScreen="/chartArchiveScreen";
  static String chartArchiveDetailsScreen="/chartArchiveDetailsScreen";
  static String appointmentScreen="/appointmentScreen";
  static String contactsScreen= "/contactsScreen";
  static String contactSearchScreen= "/contactSearchScreen";
  static String contactDetailsScreen= "/contactDetailsScreen";
  static String editContactDetailsScreen= "/editContactDetailsScreen";
  static String offLineFileScreen= "/offLineFileScreen";


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

   //App Drawer
   GetPage(name:accountSetUpScreen, page: ()=> AccountSetUpScreen(),transition: Transition.noTransition),
   GetPage(name:yourDetailsScreen, page: ()=> YourDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:treatmentScreen, page: ()=> TreatmentScreen(),transition: Transition.noTransition),
   GetPage(name:advanceSettingsScreen, page: ()=> AdvanceSettingsScreen(),transition: Transition.noTransition),
   GetPage(name:paidDetailsScreen, page: ()=> PaidDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:unPaidDetailsScreen, page: ()=> UnPaidDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:feedbackScreen, page: ()=> FeedbackScreen(),transition: Transition.noTransition),

   //Create New Chart Step
   GetPage(name:createNewChartStepOneScreen, page: ()=> CreateNewChartStepOneScreen(),transition: Transition.noTransition),
   GetPage(name:createNewChartStepTwoScreen, page: ()=> CreateNewChartStepTwoScreen(),transition: Transition.noTransition),
   GetPage(name:createNewChartStepThreeScreen, page: ()=> CreateNewChartStepThreeScreen(),transition: Transition.noTransition),
   GetPage(name:horseDetailsScreen, page: ()=> HorseDetailsScreen(),transition: Transition.noTransition),


   //ChartArchiveScreen
   GetPage(name:chartArchiveScreen, page: ()=> ChartArchiveScreen(),transition: Transition.noTransition),
   GetPage(name:chartArchiveDetailsScreen, page: ()=> ChartArchiveDetailsScreen(),transition: Transition.noTransition),

   //ChartArchiveScreen
   GetPage(name:appointmentScreen, page: ()=> AppointmentScreen(),transition: Transition.noTransition),

   //ContactsScreen
   GetPage(name:contactsScreen, page: ()=> ContactsScreen(),transition: Transition.noTransition),
   GetPage(name:contactSearchScreen, page: ()=> ContactSearchScreen(),transition: Transition.noTransition),
   GetPage(name:contactDetailsScreen, page: ()=> ContactDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:editContactDetailsScreen, page: ()=> EditContactDetailsScreen(),transition: Transition.noTransition),

   //OffLineFileScreen
   GetPage(name:offLineFileScreen, page: ()=> OffLineFileScreen(),transition: Transition.noTransition),
  ];
}