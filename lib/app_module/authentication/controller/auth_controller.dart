import 'package:flutter/material.dart';

class AuthenticationController extends ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  var emailForgetController = TextEditingController();
  var passwordOldController = TextEditingController();
  var confirmController = TextEditingController();
  bool mounted = false;
  String currentText = "";
  var otpController = TextEditingController();
  bool isEnabled = false;
  bool isvalidOtp = true;
  bool isShowPass = false;
  bool showPreference=true;
  bool isEmail = false;
  bool isEmailValidate = true;
  bool isPassword = false;
  bool isPasswordValidated = true;
  bool isPasswordForget = false;

  bool isPasswordForgetValidated = true;
  bool showException=false;

  var toolTip = GlobalKey<TooltipState>();
  final formKey = GlobalKey<FormState>();
  final setupPassKey = GlobalKey<FormState>();
  final formKeySignup = GlobalKey<FormState>();
  final formKeyForget = GlobalKey<FormState>();

  var firstController = TextEditingController();

  var lastController = TextEditingController();
  var emailRegController = TextEditingController();
  var numberController = TextEditingController();
  var passwordRegController = TextEditingController();
  String countryCode = "971";

  BuildContext? dialogContext;


  bool isFirst = false;
  bool isLast = false;
  bool isNumber = false;
  bool isFirstValidate = true;
  bool isLastValidate = true;
  bool isNumberValidate = true;




  bool showLoading = true, uiLoading = true;






  bool validateSignup(BuildContext context) {
    if(firstController.text.isEmpty){
      isFirstValidate=false;
      return false;
    }
    if (isFirstValidate==false) {
      return false;
    }
    if(lastController.text.isEmpty){
      isLastValidate=false;
      return false;
    }
    if (isLastValidate==false) {
      return false;
    }
    if(emailRegController.text.isEmpty){
      isEmailValidate=false;
      return false;
    }
    if (isEmailValidate==false) {
      return false;
    }

    if(numberController.text.toString().isEmpty){
      isNumberValidate=false;
      return false;
    }
    if (isNumberValidate==false) {
      return false;
    }
    if(passwordRegController.text.isEmpty){
      isPasswordValidated=false;
      return false;
    }
    if (isPasswordValidated==false) {
      return false;
    }

    return true;
  }


  var signupLoader=false;
  var loginLoader=false;
  var socialLoader=false;
  var forgetLoader=false;
  var setupPasswordLoader=false;
  var otpLoader=false;
  updateSignupLoader(val){
    signupLoader=val;
    notifyListeners();
  }
  updateLoginLoader(val){
    loginLoader=val;
    notifyListeners();
  }
  updateSocialLoginLoader(val){
    socialLoader=val;
    notifyListeners();
  }

  updateSetupPassword(val){
    setupPasswordLoader=val;
    notifyListeners();
  }
  updateForgetLoader(val){
    forgetLoader=val;
    notifyListeners();
  }
  updateOtpLoader(val){
    otpLoader=val;
    notifyListeners();
  }

  var errorMessage="";
   errorUpdateMessage(val){
     errorMessage=val;
     notifyListeners();
   }

  var errorForgetMessage="";
  errorUpdateForgetMessage(val){
    errorMessage=val;
    notifyListeners();
  }

  var errorOtpMessage="";
  updateOtpMessage(val){
    errorOtpMessage=val;
    notifyListeners();
  }



  clearReg(){
    errorUpdateMessage("");
    updateOtpMessage("");
    errorUpdateForgetMessage("");
    firstController.clear();
    numberController.clear();
    emailRegController.clear();
    passwordRegController.clear();
    lastController.clear();
  }

  clearLogin(){
    emailController.clear();
    passwordController.clear();

  }
  clearForget(){
    emailForgetController.clear();
    passwordOldController.clear();
    confirmController.clear();
  }

}