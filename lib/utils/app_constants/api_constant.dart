class ApiConstant {
  static const baseUrl1 = 'http://apis.bomjour.com/api/';
 static const baseUrl = 'http://95.217.153.237/api/';
  static const imageUrl = 'https://cms.bomjour.com/';

 ///api end points
  static  var onboardingApi = 'on-boarding';
  static  String topCities = 'top-cities';
  static  String getCity = 'cities/';
  static  String getCountry = 'countries';
  static  String loginUrl = 'auth/login';
  static  String registerUrl = 'auth/signup-email-verification';
  static  String verifyOtp = 'auth/verify-otp';
  static  String resendUrl = 'auth/resend-otp';
  static  String forgetSendEmail = 'auth/password-email-verification';
  static  String setupPassword = 'auth/forgot-password';
  static  String editProfile = 'update_profile';


  //Home

  static  String categoryUrl = 'categories';
  static  String customizeUrl = 'customize';
  static  String productUrl = 'products';
  static  String businessUrl = 'businesses';
  static  String getProfileUrl = 'get-profile';
  static  String getPreferenceUrl = 'preferences';
  static  String addPreference = 'preferences/add';
  static  String myPreference = 'mypreferences/';



  static bool isNotification = false;
  static String bidSlug = "";
  static String FCM_TOKEN = "";


}

