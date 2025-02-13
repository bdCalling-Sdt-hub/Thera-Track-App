class ApiConstants {
  static const String baseUrl = "http://10.0.60.71:8083/api/v1";
  static const String imageBaseUrl = "http://10.0.60.71:8083";

/*  http://192.168.10.163:8081/api/v1
  http://192.168.10.163:8081/api/v1*/

  static String googleBaseUrl="https://maps.googleapis.com/maps/api/place/autocomplete/json";
  static String googleApiKey="AIzaSyAszXC1be8aJ37eHuNcBm_-O1clWkPUwV4";

  //============================>> User Auth <<=================================
  static const String signUpEndPoint = "/auth/register";
  static const String signInEndPoint = "/auth/login";
  static const String otpVerifyEndPoint = "/auth/verify-email";
  static const String forgotPasswordEndPoint = "/auth/forgot-password";
  static const String resetPasswordEndPoint = "/auth/reset-password";
  static const String resendOTPEndPoint = "/auth/resend-otp";

  //ProfileInfo
  static const String getProfileDataEndPoint = "/user/profile";
  static const String editProfileEndPoint = "/user/profile";
  static const String updateAdvanceSettingEndPoint = "/user/change-user-status";


  //============================>> Create Clients <<=================================
  static const String createHumanClientEndPoint = "/client/create-client";
  static const String grtAllClientDataEndPoint = "/client/read-client";
  static const String clientAnimalEndPoint = "/client/get-unique-animals";
  static const String clientWithAnimalEndPoint = "/client/get-clients-with-animal";
  static const String clientDetailsByIDEndPoint = "/client/get-one-client";

  static const String createTreatmentEndPoint = "/treatment/create-treatment";
  static const String getAllTreatmentEndPoint = "/treatment/get-all-treatment";
  static const String deleteSingelTreatmentEndPoint = "/treatment/delete-treatment";
  static const String getAllAnimalUnderOneClientTreatmentEndPoint = "/client/all-animal-under-one-client";


}
