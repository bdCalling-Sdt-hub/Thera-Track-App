
import 'package:get/get.dart';
import 'package:thera_track_app/views/screens/Auth/SignIn/sign_in_screen.dart';
import 'package:thera_track_app/views/screens/Auth/SignUp/sign_up_screen.dart';
import 'package:thera_track_app/views/screens/Auth/Verification/verify_screen.dart';
import 'package:thera_track_app/views/screens/Auth/forgotPassword/forgotPassword_screen.dart';
import 'package:thera_track_app/views/screens/Auth/resetPassword/resetPassword_screen.dart';
import 'package:thera_track_app/views/screens/Home/appointment/appointment_screen.dart';
import 'package:thera_track_app/views/screens/Home/chartArchive/chartArchive_screen.dart';
import 'package:thera_track_app/views/screens/Home/chartArchive/detailsChartArchive_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/animal/animalList_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/animal/animal_contact_details_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/animal/edit_animal_contact_details_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/human/clients_contact_details_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/animal/animal_contact_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/contact_search_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/human/edit_contact_details_screen.dart';
import 'package:thera_track_app/views/screens/Home/contacts/human/human_client_contact_screen.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/appoinmentCalenderScreen.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/createNewChartDetails.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/steps/createNew_chart_stepFive.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/steps/createNew_chart_stepFour.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/steps/createNew_chart_stepOne.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/steps/createNew_chart_stepSix.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/steps/createNew_chart_stepThree.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/steps/createNew_chart_stepTwo.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/steps/equipmentScreen.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/steps/horseDetailsScreen.dart';
import 'package:thera_track_app/views/screens/Home/home_screen.dart';
import 'package:thera_track_app/views/screens/Home/inventory/inventory_screen.dart';
import 'package:thera_track_app/views/screens/Home/notification/notificationScreen.dart';
import 'package:thera_track_app/views/screens/Home/offline_file/offline_file_screen.dart';
import 'package:thera_track_app/views/screens/Home/wallet/costDetailsScreen.dart';
import 'package:thera_track_app/views/screens/Home/wallet/addCostScreen.dart';
import 'package:thera_track_app/views/screens/Home/wallet/wallet_screen.dart';
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
  static String animalContactsScreen= "/animalContactsScreen";
  static String contactSearchScreen= "/contactSearchScreen";
  static String clientsContactDetailsScreen= "/clientsContactDetailsScreen";
  static String editContactDetailsScreen= "/editContactDetailsScreen";
  static String offLineFileScreen= "/offLineFileScreen";
  static String animalContactDetailsScreen= "/animalContactDetailsScreen";
  static String animalListScreen= "/animalListScreen";
  static String editAnimalContactDetailsScreen= "/editAnimalContactDetailsScreen";
  static String createNewChartStepFourScreen = "/createNewChartStepFourScreen";
  static String createNewChartStepFiveScreen = "/createNewChartStepFiveScreen";
  static String createNewChartStepSixScreen = "/createNewChartStepSixScreen";
  static String createNewChartDetailsScreen = "/createNewChartDetailsScreen";
  static String appoinmentCalenderScreen = "/appoinmentCalenderScreen";
  static String notificationScreen = "/notificationScreen";
  static String resetPassword = "/resetPassword";
  static String inventoryScreen = "/inventoryScreen";
  static String walletDetailsScreen = "/walletDetailsScreen";
  static String costAddScreen = "/costAddScreen";
  static String costDetailsScreen = "/costDetailsScreen";
  static String equipmentScreen = "/equipmentScreen";
  static String humanContactsScreen = "/humanContactsScreen";


 static List<GetPage> page=[

   //Auth part
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:onboardingScreen, page: ()=>const OnboardingScreen()),

    GetPage(name:signInScreen, page: ()=>const SignInScreen()),
    GetPage(name:signUpScreen, page: ()=>const SignUpScreen()),
    GetPage(name:forgotPasswordScreen, page: ()=>const ForgotPasswordScreen()),
    GetPage(name:verifyScreen, page: ()=>const VerifyScreen()),
    GetPage(name:resetPassword, page: ()=>const ResetPassword()),

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
   GetPage(name:createNewChartStepFourScreen, page: ()=> CreateNewChartStepFourScreen(),transition: Transition.noTransition),
   GetPage(name:createNewChartStepFiveScreen, page: ()=> CreateNewChartStepFiveScreen(),transition: Transition.noTransition),
   GetPage(name:createNewChartStepSixScreen, page: ()=> CreateNewChartStepSixScreen(),transition: Transition.noTransition),

   GetPage(name:createNewChartDetailsScreen, page: ()=> CreateNewChartDetailsScreen(),transition: Transition.noTransition),

   GetPage(name:horseDetailsScreen, page: ()=> HorseDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:appoinmentCalenderScreen, page: ()=> AppoinmentCalenderScreen(),transition: Transition.noTransition),


   //ChartArchiveScreen
   GetPage(name:chartArchiveScreen, page: ()=> ChartArchiveScreen(),transition: Transition.noTransition),
   GetPage(name:chartArchiveDetailsScreen, page: ()=> ChartArchiveDetailsScreen(),transition: Transition.noTransition),

   //ChartArchiveScreen
   GetPage(name:appointmentScreen, page: ()=> AppointmentScreen(),transition: Transition.noTransition),

   //ContactsScreen
   GetPage(name:animalContactsScreen, page: ()=> AnimalContactsScreen(),transition: Transition.noTransition),
   GetPage(name:contactSearchScreen, page: ()=> ContactSearchScreen(),transition: Transition.noTransition),
   GetPage(name:clientsContactDetailsScreen, page: ()=> ClientsContactDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:editContactDetailsScreen, page: ()=> EditContactDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:animalContactDetailsScreen, page: ()=> AnimalContactDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:animalListScreen, page: ()=> AnimalListScreen(),transition: Transition.noTransition),
   GetPage(name:editAnimalContactDetailsScreen, page: ()=> EditAnimalContactDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:humanContactsScreen, page: ()=> HumanContactsScreen(),transition: Transition.noTransition),

   //OffLineFileScreen
   GetPage(name:offLineFileScreen, page: ()=> OffLineFileScreen(),transition: Transition.noTransition),

   //Inventory Screen
   GetPage(name:inventoryScreen, page: ()=> InventoryScreen(),transition: Transition.noTransition),
   // Wallet Details Screen
   GetPage(name:walletDetailsScreen, page: ()=> WalletDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:costAddScreen, page: ()=> CostAddScreen(),transition: Transition.noTransition),
   GetPage(name:costDetailsScreen, page: ()=> CostDetailsScreen(),transition: Transition.noTransition),

   //Notification
   GetPage(name:notificationScreen, page: ()=> NotificationScreen(),transition: Transition.noTransition),


   // EquipmentScreen
   GetPage(name:equipmentScreen, page: ()=> EquipmentScreen(),transition: Transition.noTransition),
  ];
}