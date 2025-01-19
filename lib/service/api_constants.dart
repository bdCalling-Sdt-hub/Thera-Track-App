class ApiConstants {
  static const String baseUrl = "http://192.168.10.163:8081/api/v1";
  static const String imageBaseUrl = "http://192.168.10.163:8081";

/*  http://192.168.10.163:8081/api/v1
  http://192.168.10.163:8081/api/v1*/

  static String googleBaseUrl="https://maps.googleapis.com/maps/api/place/autocomplete/json";
  static String googleApiKey="AIzaSyAszXC1be8aJ37eHuNcBm_-O1clWkPUwV4";

  //============================>> User Auth <<=================================
  static const String userLogInEndPoint = "/auth/login";
  static const String signUpEndPoint = "/auth/register";
  static const String isPhoneNumberExist = "/auth/isPhoneNumberExist";
  static const String verify_otp = "/auth/verify-otp";
  static const String resend_otp = "/auth/resend-otp";
  static const String forgetPasswordEndPoint = "/auth/forgot-password";
  static const String resetPasswordEndPoint = "/auth/reset-password";
  static const String changePasswordEndPoint = "/auth/change-password";

  static const String getUserOrderEndPoint = "/order/user-orders";
  static const String getUserCompletedOrderEndPoint = "/order/completed-orders";

//============================>> Profile Update <<==========================
  static const String fillUpProfileEndPoint = "/users/fill-up-profile";
  static  String getProfileDataEndPoint(String id) => "/users/$id";
  static  String editProfileEndPoint(String id) => "/users/updateProfile/$id";
  static  String profileSetLocationEndPoint = "/users/setLocation";

//============================>> Get All Product  <<==========================
  static const String getAllProductEndPoint = "/product";
  static const String getCategoryEndPoint = "/category";

  static const String getShopTimingEndPoint = "/admin/shop-timing";
  static const String getOrderStatisticsEndPoint = "/order/order-statistics";




//============================>> Settings  <<==========================
  static const String aboutUsEndPoint = "/setting/aboutUs";
  static const String termsConditionsEndPoint = "/setting/termsConditions";
  static const String privacyPolicyEndPoint = "/setting/privacyPolicy";
  static const String notificationEndPoint = "/notification";
  static const String getAllPromotionEndPoint = "/promotion";

//============================>> Get Order Employee EndPoint  <<==========================
  static const String getOrderEmployeeEndPoint = "/order/employee-orders";
  static const String getOrderDetailsEndPoint = "/order";
  static const String createOrder = "/order";
  static const String getEmployeeDeliveryOrderEndPoint = "/order/employee-completed-orders";



  static const String getOrderStatusEndPoint = "/order/update-status";


//============================>> Add To Cart EndPoint  <<==========================
  static const String addToCartEndPoint = "/cart";
  static const String getAddToCartEndPoint = "/cart";
  static const String deleteCartEndPoint = "/cart";
  static const String paymentMethodEndPoint = "/paymentMethod";
  static const String validateCouponEndPoint = "/coupon";
  static const String reviewEndPoint = "/review";
}
