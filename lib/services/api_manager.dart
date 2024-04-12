// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/address/model/get_address_model.dart';
import 'package:bomjour/app_module/address/model/property_type_model.dart';
import 'package:bomjour/app_module/authentication/account_created_view/view/account_created_view.dart';
import 'package:bomjour/app_module/authentication/controller/auth_controller.dart';
import 'package:bomjour/app_module/authentication/forget_password/setup_password.dart';
import 'package:bomjour/app_module/authentication/otp_verification/otp_view.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/controller/add_occasion_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/model/group_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/business_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/cateegory_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/customize_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/occassion_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/product_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/search_model.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/controller/wishlist_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/model/wishlist_model.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/model/profile_model.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/cart_view/model/cart_model.dart';
import 'package:bomjour/app_module/country_selection/model/city_model.dart';
import 'package:bomjour/app_module/country_selection/model/country_model.dart';
import 'package:bomjour/app_module/filter_view/model/result_search_model.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/app_module/home/view/home_view.dart';
import 'package:bomjour/app_module/on_boarding/model/onboarding_model.dart';
import 'package:bomjour/app_module/order_history/model/order_history_model.dart';
import 'package:bomjour/app_module/order_placed/view/order_place_view.dart';
import 'package:bomjour/app_module/prefrence/controller/prefrence_controller.dart';
import 'package:bomjour/app_module/prefrence/model/my_prefrence_model.dart';
import 'package:bomjour/app_module/prefrence/model/prefrence_model.dart';
import 'package:bomjour/app_module/product_detail_page/model/product_detail_model.dart';
import 'package:bomjour/app_module/product_detail_page/model/similar_product_model.dart';
import 'package:bomjour/app_module/product_detail_page/model/wrapper_model.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/api_constant.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiManger {
  ///onboarding api
  static Future<OnBoardingModel?> onboardingModel() async {
    var response = await http.get(
      Uri.parse("${ApiConstant.baseUrl}${ApiConstant.onboardingApi}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      },
    );
    print(response.request?.url);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return OnBoardingModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      return null;
    }
  }

  ///country api
  List<CountryModel> parseCountryList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CountryModel>((json) => CountryModel.fromJson(json))
        .toList();
  }

  Future<List<CountryModel>?> getCountryModel() async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getCountry}"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
      );
      print(response.request?.url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("response.body");
        print(response.body);
        return parseCountryList(jsonString);
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  ///city api

  Future<List<CityModel>?> topCityModel() async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}${ApiConstant.topCities}"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
      );
      print(response.request?.url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("response.body");
        print(response.body);
        return parseCityList(jsonString);
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  ///city api

  List<CityModel> parseCityList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CityModel>((json) => CityModel.fromJson(json)).toList();
  }

  Future<List<CityModel>?> getCityIdModel({String id = ""}) async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getCity}$id"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
      );
      print(response.request?.url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("response.body");
        print(response.body);
        return parseCityList(jsonString);
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  ///Login

  loginResponse({required BuildContext context}) async {
    final authController =
        Provider.of<AuthenticationController>(context, listen: false);
    try {
      dio.FormData data = dio.FormData.fromMap({

        'email': authController.emailController.text,
        'password': authController.passwordController.text,

      });
      print("Data::::: ${data.fields}");
      var response =
          await dio.Dio().post(ApiConstant.baseUrl + ApiConstant.loginUrl,
              data: data,
              options: dio.Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }));
      debugPrint(response.realUri.toString());
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {

        authController.updateLoginLoader(false);
        authController.errorUpdateMessage("");
        if(response.data["response"]["status"] == 400||response.data["response"]["status"] == 402 ){
          if(response.data["response"]["message"]=="Please verify your email"){
            flutterToast(msg: response.data["response"]["message"].toString());
            resendOtp(context: context,email: authController.emailController.text);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpView(type: "verify",)),
            );
          }
          else{
            flutterToast(msg: response.data["response"]["message"].toString());

          }
        }
        else{
          print("object");
          HelperFunctions.saveInPreference(
              "token", response.data["response"]['token'].toString());
          HelperFunctions.saveInPreference(
              "email", response.data["response"]['user_details']["email"].toString());

          HelperFunctions.saveInPreference(
              "name", "${response.data["response"]['user_details']['first_name'].toString()} ${response.data["response"]['user_details']['last_name'].toString()}");
          HelperFunctions.saveInPreference(
              "id", "${response.data["response"]['user_details']['id'].toString()}");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
                (route) => false,
          );
          authController.clearForget();
          authController.clearReg();
          authController.clearLogin();
        }




        print(response.data);
      }

    }

    on dio.DioError catch (e) {
      if(e.response?.statusCode == 400){
        authController.updateLoginLoader(false);
        authController.errorUpdateMessage("");
        flutterToast(msg: e.response?.data["message"].toString());
      }
      else{
        authController.updateLoginLoader(false);
        String error = '';
        Map<String, dynamic> errors = e.response!.data['errors'];
        if (errors.isNotEmpty) {
          errors.forEach((key, value) {
            error += '${value[0]}\n';
          });
          flutterToast(msg: error.toString());
          authController.errorUpdateMessage(error.toString());
          authController.updateLoginLoader(false);
          print(e.response?.data);
        }
      }

    }
  }


  ///signup

  signupResponse({required BuildContext context}) async {
    final authController =
    Provider.of<AuthenticationController>(context, listen: false);
    try {
      dio.FormData data = dio.FormData.fromMap({
        'first_name': authController.firstController.text,
        'last_name': authController.lastController.text,
        'email': authController.emailRegController.text,
        'password': authController.passwordRegController.text,
        'phone':
        authController.countryCode + authController.numberController.text,
      });
      print("Data::::: ${data.fields}");
      var response =
      await dio.Dio().post(ApiConstant.baseUrl + ApiConstant.registerUrl,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      debugPrint(response.realUri.toString());
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        authController.updateSignupLoader(false);
        authController.errorUpdateMessage("");
        flutterToast(msg: response.data["message"].toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtpView()),
        );
        print(response.data);
      }

    }

    on dio.DioError catch (e) {
      if(e.response?.statusCode == 400){
        authController.updateSignupLoader(false);
        authController.errorUpdateMessage("");
        flutterToast(msg: e.response?.data["message"].toString());
      }
      else{
        authController.updateSignupLoader(false);
        String error = '';
        Map<String, dynamic> errors = e.response!.data['errors'];
        if (errors.isNotEmpty) {
          errors.forEach((key, value) {
            error += '${value[0]}\n';
          });
          flutterToast(msg: error.toString());
          authController.errorUpdateMessage(error.toString());
          authController.updateSignupLoader(false);
          print(e.response?.data);
        }
      }

    }
  }

  ///Otp

  verifyOtp(
      {required BuildContext context,
      String otp = "",
      String type = "",
      String email = ""}) async {
    final authController =
        Provider.of<AuthenticationController>(context, listen: false);
    try {
      dio.FormData data = dio.FormData.fromMap({
        'otp': otp,
        'email': email,
      });
      print("Data::::: ${data.fields}");
      print(ApiConstant.baseUrl + ApiConstant.verifyOtp);
      print(ApiConstant.baseUrl + ApiConstant.verifyOtp);
      var response =
          await dio.Dio().post(ApiConstant.baseUrl + ApiConstant.verifyOtp,
              data: data,
              options: dio.Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }));
      debugPrint(response.realUri.toString());
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        authController.updateOtpLoader(false);
        if(response.data["status"]==false){
          authController.updateOtpMessage(response.data["message"]);
        }
        else{
          if(type=="Forget"){

            Navigator.of(context, rootNavigator: false).pushReplacement(
              MaterialPageRoute(builder: (context) => SetupPassword()),
            );
          }
          else{
            authController.updateOtpMessage("");
            Navigator.of(context, rootNavigator: false).pushReplacement(
              MaterialPageRoute(builder: (context) => AccountCreatedView()),
            );
          }

        }
        flutterToast(msg: response.data["message"]);


        print(response.data);
      }
    } on dio.DioError catch (e) {
      authController.updateOtpMessage("");
      authController.updateOtpLoader(false);
      print(e.response?.data);
       flutterToast(msg: e.response?.data["message"]);
      print("This is error${e.response?.data}");
    }
  }


  /// resend Otp

  resendOtp(
      {required BuildContext context,

        String email = ""}) async {
    final authController =
    Provider.of<AuthenticationController>(context, listen: false);
    try {
      dio.FormData data = dio.FormData.fromMap({

        'email': email,
      });
      print("Data::::: ${data.fields}");
      var response =
      await dio.Dio().post(ApiConstant.baseUrl + ApiConstant.resendUrl,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      debugPrint(response.realUri.toString());
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {



        print(response.data);
      }
    } on dio.DioError catch (e) {
      print("This is error${e.response?.data}");
    }
  }

  /// forget Email
  forgetEmail(
      {required BuildContext context}) async {
    final authController =
    Provider.of<AuthenticationController>(context, listen: false);
    try {
      dio.FormData data = dio.FormData.fromMap({

        'email':authController.emailForgetController.text ,
      });
      print("Data::::: ${data.fields}");
      var response =
      await dio.Dio().post(ApiConstant.baseUrl + ApiConstant.forgetSendEmail,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      debugPrint(response.realUri.toString());
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        authController.updateForgetLoader(false);
        flutterToast(msg: response.data["message"].toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtpView(type: "Forget",)),
        );

        print(response.data);
      }
    } on dio.DioError catch (e) {
      authController.updateForgetLoader(false);
      flutterToast(msg: e.response?.data["message"]);
      print("This is error${e.response?.data}");
    }
  }


  /// forget Email
  setupPassword(
      {required BuildContext context}) async {
    final authController =
    Provider.of<AuthenticationController>(context, listen: false);
    try {
      dio.FormData data = dio.FormData.fromMap({

        'email':authController.emailForgetController.text ,
        'password':authController.passwordOldController.text ,
        'password_confirmation':authController.confirmController.text ,
      });
      print("Data::::: ${data.fields}");
      var response =
      await dio.Dio().post(ApiConstant.baseUrl + ApiConstant.setupPassword,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      debugPrint(response.realUri.toString());
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        authController.updateSetupPassword(false);
        flutterToast(msg: response.data["message"].toString());
        authController.clearForget();
        Navigator.pop(context);
        Navigator.pop(context);


        print(response.data);
      }
    } on dio.DioError catch (e) {
    flutterToast(msg: e.response?.data["message"]);
    authController.updateSetupPassword(false);
      print("This is error${e.response?.data}");
    }
  }


  ///social Login

  socialLogin(
      {required BuildContext context,String type="",String tokenAuth="",String email="",String name=""}) async {
    final authController =
    Provider.of<AuthenticationController>(context, listen: false);
    try {
      dio.FormData data = dio.FormData.fromMap({

        'email':email ,
        'first_name':name ,
        'auth_token':tokenAuth ,
        'social_type':type ,
      });
      print("Data::::: ${data.fields}");
      var response =
      await dio.Dio().post(ApiConstant.baseUrl + ApiConstant.loginUrl,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      debugPrint(response.realUri.toString());
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {


        if(response.data["response"]["status"] == 400||response.data["response"]["status"] == 402 ){
          flutterToast(msg: response.data["response"]["message"].toString());
        }
        else{
          HelperFunctions.saveInPreference(
              "token", response.data["response"]['token'].toString());
          HelperFunctions.saveInPreference(
              "email", response.data["response"]['user_details']["email"].toString());

          HelperFunctions.saveInPreference(
              "name", "${response.data["response"]['user_details']['first_name'].toString()}");
          HelperFunctions.saveInPreference(
              "id", "${response.data["response"]['user_details']['id'].toString()}");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
                (route) => false,
          );

          authController.clearForget();
          authController.clearReg();
          authController.clearLogin();
          flutterToast(msg: response.data["response"]["message"].toString());
        }
        authController.updateSocialLoginLoader(false);



        print(response.data);
      }
    } on dio.DioError catch (e) {
      authController.updateSocialLoginLoader(false);
      flutterToast(msg: e.response?.data["message"]);

      print("This is error${e.response?.data}");
    }
  }



  List<CategoryModel> parseCatList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CategoryModel>((json) => CategoryModel.fromJson(json))
        .toList();
  }
  Future<List<CategoryModel>?> categoryModel() async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}${ApiConstant.categoryUrl}"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
      );
      print(response.request?.url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("response.body");
        print(response.body);
        return parseCatList(jsonString);
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }



  List<CustomizeModel> parseCustomizeList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CustomizeModel>((json) => CustomizeModel.fromJson(json))
        .toList();
  }
  Future<List<CustomizeModel>?> customizeModel() async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}${ApiConstant.customizeUrl}"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
      );
      print(response.request?.url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("response.body");
        print(response.body);
        return parseCustomizeList(jsonString);
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }



  List<PreferenceModel> parsePrefrenceList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<PreferenceModel>((json) => PreferenceModel.fromJson(json))
        .toList();
  }
  Future<List<PreferenceModel>?> prefrenceModel() async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getPreferenceUrl}"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
      );
      print(response.request?.url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("response.body");
        print(response.body);
        return parsePrefrenceList(jsonString);
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }






  List<BusinessModel> parseBusinessList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<BusinessModel>((json) => BusinessModel.fromJson(json))
        .toList();
  }
  Future<List<BusinessModel>?> businessModel() async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}${ApiConstant.businessUrl}"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
      );
      print(response.request?.url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("response.body");
        print(response.body);
        return parseBusinessList(jsonString);
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }


  static Future<ProductsModel?> productModel() async {
    var response = await http.get(
      Uri.parse("${ApiConstant.baseUrl}${ApiConstant.productUrl}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      },
    );
    print(response.request?.url);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return ProductsModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      return null;
    }
  }

  Future<SearchModel?> getSearchModel({String ?search}) async {
    var response = await http.get(
      Uri.parse(
          "${ApiConstant.baseUrl}select-product?search_query=${
              search==null?"":
              search.toString()}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',

      },
    );
    print(response.request?.url);

    if (response.statusCode == 200 ||response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return SearchModel.fromJson(jsonString);
    } else {
      var jsonString = jsonDecode(response.body);


      return SearchModel.fromJson(jsonString);
    }
  }

  Future<ResultSearchModel?> getSearchResultModel({String specialId ="",String  countryName ="", String  date ="",String occasionId ="", String  fromPrice="", String  toPrice="",
    String productName="", String  catIId="",
  }) async {
    var response = await http.get(
      Uri.parse(
          "${ApiConstant.baseUrl}products?"
              "${specialId == "" ? "" : "&specialize_for_id=${specialId.toString()}"}"
              "${countryName == "" ? "" : "&country=${countryName.toString()}"}"
              "${date == "" ? "" : "&by_date=${date.toString()}"}"
              "${occasionId == "" ? "" : "&occasion_id=${occasionId.toString()}"}"
              "${fromPrice == "" ? "" : "&from_price=${fromPrice.toString()}"}"
              "${toPrice == "" ? "" : "&to_price=${toPrice.toString()}"}"
              "${productName == "" ? "" : "&product_name=${productName.toString()}"}"
              "${catIId == "" ? "" : "&category_id=${catIId.toString()}"}"

      ),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',

      },
    );
    print(response.request?.url);

    if (response.statusCode == 200 ||response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return ResultSearchModel.fromJson(jsonString);
    } else {
      var jsonString = jsonDecode(response.body);


      return ResultSearchModel.fromJson(jsonString);
    }
  }
  Future<List<OccassionModel>> getAllOccasionModel() async {
    var response = await http.get(
      Uri.parse("${ApiConstant.baseUrl}occasions"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonArray = jsonDecode(response.body) as List<dynamic>;

      List<OccassionModel> occasionList = jsonArray
          .map((json) => OccassionModel.fromJson(json))
          .toList();

      return occasionList;
    } else {
      throw Exception('Failed to load occasions');
    }
  }





  Future<List<OccassionModel>> getSpecialModel() async {
    var response = await http.get(
      Uri.parse("${ApiConstant.baseUrl}specialize-for"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonArray = jsonDecode(response.body) as List<dynamic>;

      List<OccassionModel> occasionList = jsonArray
          .map((json) => OccassionModel.fromJson(json))
          .toList();

      return occasionList;
    } else {
      throw Exception('Failed to load occasions');
    }
  }


  Future<ProductDetailModel?> productDetailModel({String? id,required BuildContext context}) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['product_id'] = id.toString();

    print(jsonEncode(body));

    var response =
    await http.post(Uri.parse("${ApiConstant.baseUrl}product/detail"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader:
          "Bearer ${Provider.of<HomeController>(context, listen: false).token}"
        },
        body: jsonEncode(body));
    print(response.request?.url.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);

      print(response.statusCode);
      print(response.body);

      print(jsonString.toString());
      return ProductDetailModel.fromJson(jsonString);
    } else {
      var jsonString = jsonDecode(response.body);
      return ProductDetailModel.fromJson(jsonString);
    }
  }



  Future<GetSimilarModel?> getProductSimilarModel({String? id,required BuildContext context}) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['product_id'] = id.toString();

    print(jsonEncode(body));

    var response =
    await http.post(Uri.parse("${ApiConstant.baseUrl}product/similar"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader:
          "Bearer ${Provider.of<HomeController>(context, listen: false).token}"
        },
        body: jsonEncode(body));
    print(response.request?.url.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);

      print(response.statusCode);
      print(response.body);

      print(jsonString.toString());
      return GetSimilarModel.fromJson(jsonString);
    } else {
      var jsonString = jsonDecode(response.body);
      return GetSimilarModel.fromJson(jsonString);
    }
  }

  Future<AllWrapperModel?> getAllWrapperModel() async {
    var response = await http.get(
      Uri.parse(
          "${ApiConstant.baseUrl}wrappers"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',

      },
    );
    print(response.request?.url);

    if (response.statusCode == 200 ||response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return AllWrapperModel.fromJson(jsonString);
    } else {
      var jsonString = jsonDecode(response.body);


      return AllWrapperModel.fromJson(jsonString);
    }
  }

  Future<OrderHistoryModel?> getOrderModel({required BuildContext context}) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['customer_id'] = Provider.of<HomeController>(context, listen: false).id.toString();

    print(jsonEncode(body));

    var response =
    await http.post(Uri.parse("${ApiConstant.baseUrl}orders/listing"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader:
          "Bearer ${Provider.of<HomeController>(context, listen: false).token}"
        },
        body: jsonEncode(body));
    print(response.request?.url.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);

      print(response.statusCode);
      print(response.body);

      print(jsonString.toString());
      return OrderHistoryModel.fromJson(jsonString);
    } else {
      var jsonString = jsonDecode(response.body);
      return OrderHistoryModel.fromJson(jsonString);
    }
  }

  Future<void> orderPlaceData({ required List<AddProductModel> cartItems,
    String ? total,
    String ? orderStatus,
    String ? isPaid,
    String ? sameAddress,
    String ? cusId,
    String ? billingId,
    String ? wrapId,
    String ? addressId,
    required BuildContext context



  }) async {
    try {

      List<Map<String, dynamic>> servicesCartItems = cartItems.map((item) {
        return {
          "type": item.type.toString(),
          "unit_price":item.productPrice.toString(),
          "price_id": item.productPriceId.toString(),
          "type_id": item.productId.toString(),
          "quantity": item.quantity.toString(),
          "business_id": item.busId.toString(),


        };
      }).toList();

      final Map<String, dynamic> requestData = {
        "total": total,
        "order_status":orderStatus,
        "is_paid": isPaid,
        "wrapper_id": wrapId,
        "addresses_are_same": sameAddress,
        "customer_id": cusId,
        "billing_address_id": billingId,
        "delivery_address_id": addressId,
        "order_detail": servicesCartItems,
      };

      print("Data::::: $requestData");

      var response = await dio.Dio().post(
        ApiConstant.baseUrl + "orders/add",
        data: requestData,
        options: dio.Options(
          headers: {

            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
            "Bearer ${Provider.of<HomeController>(context, listen: false).token.toString()}"
          },
        ),
      );

      debugPrint(response.realUri.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        if (response.data["response"]["status"] == 200) {


          flutterToast(msg: response.data["response"]["message"].toString());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  ThanksView(data:response.data["response"]["order_id"].toString() ,)),
          );
        } else {

          flutterToast(msg: response.data["response"]["message"].toString());
        }
        Provider.of<CartController>(context, listen: false).updateLoader(false);

      }
    } catch (e) {
      Provider.of<CartController>(context, listen: false).updateLoader(false);
      print(e.toString());

      print("Error: $e");
    }
  }




  Future<WishlistModel?> getWishlistModel({String id="",String token=""}) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['customer_id'] = id.toString();

    print(jsonEncode(body));

    var response =
    await http.post(Uri.parse("${ApiConstant.baseUrl}wishlist/list"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader:
          "Bearer $token"
        },
        body: jsonEncode(body));
    print(response.request?.url.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);

      print(response.statusCode);
      print(response.body);

      print(jsonString.toString());
      return WishlistModel.fromJson(jsonString);
    } else {
      var jsonString = jsonDecode(response.body);
      return WishlistModel.fromJson(jsonString);
    }
  }


  removeFav({
    String id = "",
    String customerId = "",


    required BuildContext context
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'customer_id': customerId,
        'type': "product",
        'type_id': id,

      };

      print("Data::::: $requestData");

      var response = await dio.Dio().post(
        ApiConstant.baseUrl + "wishlist/delete",
        data: requestData,
        options: dio.Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
            "Bearer ${Provider.of<HomeController>(context, listen: false).token.toString()}"
          },
        ),
      );

      debugPrint(response.realUri.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        Provider.of<WishlistController>(context, listen: false)
            .getWishDataAll(id:(Provider.of<HomeController>(context, listen: false).id).toString(), isLoading: false,token:(Provider.of<HomeController>(context, listen: false).token).toString());
      }
    } catch (e) {


    }
  }

  addFav({
    String id = "",
    String customerId = "",


    required BuildContext context
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'customer_id': customerId,
        'type': "product",
        'type_id': id,

      };

      print("Data::::: $requestData");

      var response = await dio.Dio().post(
        ApiConstant.baseUrl + "wishlist/add",
        data: requestData,
        options: dio.Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
            "Bearer ${Provider.of<HomeController>(context, listen: false).token.toString()}"
          },
        ),
      );

      debugPrint(response.realUri.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        Provider.of<WishlistController>(context, listen: false)
            .getWishDataAll(id:(Provider.of<HomeController>(context, listen: false).id).toString(), isLoading: false,token:(Provider.of<HomeController>(context, listen: false).token).toString());
      }
    } catch (e) {


    }
  }


  static Future<GetProfileModel?> profileModel({required BuildContext context}) async {
    var response = await http.get(
      Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getProfileUrl}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader:
        "Bearer ${Provider.of<HomeController>(context, listen: false).token.toString()}"
      },
    );
    print(response.request?.url);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return GetProfileModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      return null;
    }
  }


  Future<void> addGroupModel({ required List<AddGroupModel> groupItem,
    required BuildContext context



  }) async {
    try {

      List<Map<String, dynamic>> groupServicesItems = groupItem.map((item) {
        return {
          "contact_name": item.contactName.toString(),
          "mobile":item.mobile.toString(),



        };
      }).toList();

      final Map<String, dynamic> requestData = {
        "title": Provider.of<AddOccasionController>(context, listen: false).groupNameController.text,
        "contacts": groupServicesItems,
      };

      print("Data::::: $requestData");

      var response = await dio.Dio().post(
        ApiConstant.baseUrl + "add_contact_group",
        data: requestData,
        options: dio.Options(
          headers: {

            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
            "Bearer ${Provider.of<HomeController>(context, listen: false).token.toString()}"
          },
        ),
      );

      debugPrint(response.realUri.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);


      }
    } catch (e) {

      print(e.toString());

      print("Error: $e");
    }
  }





  Future<GetPropertyTypeModel?> getPropertyModel() async {
    var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}property-types"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        });
    print(response.request?.url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return GetPropertyTypeModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

//show error message
      return null;
    }
  }

  Future<GetAddressModel?> getAddressModel({String id="",String token=""}) async {
    var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}addresses/list/$id"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader:
          "Bearer $token"
        });
    print(response.request?.url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return GetAddressModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

//show error message
      return null;
    }
  }


  addAddress({
    String id = "",
    String address = "",
    String addressName = "",
    String floorNo = "",
    String type = "",
    String city = "",
    String lat = "",
    String lng = "",
    required BuildContext context
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'customer_id': id,
        'name': addressName,
        'address': address,
        'floor_no': floorNo,
        'property_type': type,
        'city':city,
        'latitude': lat,
        'longitude':lng,
      };

      print("Data::::: $requestData");

      var response = await dio.Dio().post(
        ApiConstant.baseUrl + "addresses/add",
        data: requestData,
        options: dio.Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
            "Bearer ${(Provider.of<HomeController>(context, listen: false).token).toString()}"
          },
        ),
      );

      debugPrint(response.realUri.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        if (response.data["response"]["status"] == 201) {
          Provider.of<AddressController>(context, listen: false)
              .getAllAddress(id: id,token:(Provider.of<HomeController>(context, listen: false).token).toString() );
          print("After getAllAddress call");
          Navigator.pop(context);
          Provider.of<AddressController>(context, listen: false).updateAddAddress(false);


          flutterToast(msg: response.data["response"]["message"].toString());
        } else {
          Provider.of<AddressController>(context, listen: false).updateAddAddress(false);

          flutterToast(msg: response.data["response"]["message"].toString());
        }
      }
    } catch (e) {
      Provider.of<AddressController>(context, listen: false).updateAddAddress(false);

    }
  }

  updateAddress({
    String id = "",
    String address = "",
    String floorNo = "",
    String type = "",
    String addressId = "",
    String addressName = "",
    String city = "",
    String lat = "",
    String lng = "",
    required BuildContext context
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'customer_id': id,
        'name': addressName,
        'address': address,
        'floor_no': floorNo,
        'property_type': type,
        'address_id': addressId,
        'city':city,
        'latitude': lat,
        'longitude':lng,
      };

      print("Data::::: $requestData");

      var response = await dio.Dio().post(
        ApiConstant.baseUrl + "addresses/update",
        data: requestData,
        options: dio.Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
            "Bearer ${(Provider.of<HomeController>(context, listen: false).token).toString()}"
          },
        ),
      );

      debugPrint(response.realUri.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        if (response.data["response"]["status"] == 201) {
          Provider.of<AddressController>(context, listen: false)
              .getAllAddress(id: id.toString(),token:((Provider.of<HomeController>(context, listen: false).token).toString()));
          print("After getAllAddress call");
          Navigator.pop(context);
          Provider.of<AddressController>(context, listen: false).updateAddAddress(false);


          flutterToast(msg: response.data["response"]["message"].toString());
        } else {
          Provider.of<AddressController>(context, listen: false).updateAddAddress(false);

          flutterToast(msg: response.data["response"]["message"].toString());
        }
      }
    } catch (e) {
      Provider.of<AddressController>(context, listen: false).updateAddAddress(false);

    }
  }


  deleteAddress({
    String id = "",

    required BuildContext context
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'id': id,

      };

      print("Data::::: $requestData");

      var response = await dio.Dio().post(
        ApiConstant.baseUrl + "addresses/delete",
        data: requestData,
        options: dio.Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
            "Bearer ${(Provider.of<HomeController>(context, listen: false).token).toString()}"
          },
        ),
      );

      debugPrint(response.realUri.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        if (response.data["response"]["status"] == 200) {
          Provider.of<AddressController>(context, listen: false)
              .getAllAddress(id:(Provider.of<HomeController>(context, listen: false).token).toString(), isLoading: false,token:(Provider.of<HomeController>(context, listen: false).token).toString());
          print("After getAllAddress call");
        } else {

        }
      }
    } catch (e) {


    }
  }



  Future<void> addPreferenceView({  required List<String> selectedIds,
    required BuildContext context



  }) async {

    try {

      final Map<String, dynamic> requestData = {
        "user_id": Provider.of<HomeController>(context, listen: false).id,
        "preferences": selectedIds,
      };

      print("Data::::: $requestData");

      var response = await dio.Dio().post(
        ApiConstant.baseUrl + ApiConstant.addPreference,
        data: requestData,
        options: dio.Options(
          headers: {

            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
            "Bearer ${Provider.of<HomeController>(context, listen: false).token.toString()}"
          },
        ),
      );

      debugPrint(response.realUri.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        flutterToast(msg: response.data["message"]);
        Provider.of<PreferenceController>(context, listen: false).updateAddPrefLoader(false);


      }
    } catch (e) {
      Provider.of<PreferenceController>(context, listen: false).updateAddPrefLoader(false);
      print(e.toString());
      flutterToast(msg: e.toString());

      print("Error: $e");
    }
  }
  static Future<GetMyPreferenceModel?> myPreferenceModel({required BuildContext context}) async {
    var response = await http.get(
      Uri.parse("${ApiConstant.baseUrl}${ApiConstant.myPreference}${Provider.of<HomeController>(context, listen: false).id.toString()}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader:
        "Bearer ${Provider.of<HomeController>(context, listen: false).token.toString()}"
      },
    );
    print(response.request?.url);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return GetMyPreferenceModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      return null;
    }
  }



  editProfile({

    String name = "",
    String phone = "",
    File ?file,
    required BuildContext context

  }) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'first_name': name,
          'phone': phone,
          'id': Provider.of<HomeController>(context, listen: false).id.toString(),
          file == null ? "" : 'profile_photo':
          file == null
              ? ""
              : await dio.MultipartFile.fromFile(
              file.path),
        });
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response =
        await dio.Dio().post(ApiConstant.baseUrl + ApiConstant.editProfile,
            data: data,
            options: dio.Options(headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Accept': 'application/json',
              HttpHeaders.authorizationHeader:
              "Bearer ${Provider.of<HomeController>(context, listen: false).token.toString()}"
            }));
        if (response.statusCode == 200) {
          flutterToast(msg: "Profile Update Successfully");
          Provider.of<HomeController>(context, listen: false).getProfileData(context: context);
          print(response.data);
          Provider.of<HomeController>(context, listen: false).updateProfileLoader(false);
        }
      } on dio.DioError catch (e) {


        flutterToast(msg: e.response?.data.toString());

        Provider.of<HomeController>(context, listen: false).updateProfileLoader(false);
        // log("e.response");
        print(e.response?.data.toString());
      }
    } on dio.DioError catch (e) {
      Provider.of<HomeController>(context, listen: false).updateProfileLoader(false);
      flutterToast(msg: e.response?.data.toString());
      print(e.response?.data.toString());
    }
  }

}
