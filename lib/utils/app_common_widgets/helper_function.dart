import 'dart:io';
import 'dart:async';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HelperFunctions {


  static Future<File?> pickImage(ImageSource imageSource) async {
    File imageFile;
    final file = await ImagePicker().pickImage(source: imageSource,imageQuality: 20);
    if (file != null) {
      imageFile = File(file.path);
      return imageFile;
    } else {
      print("No image selected");
    }
    return null;
  }


  static saveInPreference(String preName, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(preName, value);
    print('Bismillah: In save preference function');
  }

  static Future<String> getFromPreference(String preName) async {
    String returnValue = "";

    final prefs = await SharedPreferences.getInstance();
    returnValue = prefs.getString(preName) ?? "";
    return returnValue;
  }



  Future<bool>  clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return true;
  }
}

Future<bool> signout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}


Widget loader({double?height}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: height??0,),
      Center(
        child: Container(
          height: 57,width: 57,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
            color: AppLightColors.primary_color,),
          child:  Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: AppLightColors.textField_back_dark.withOpacity(0.5),
                valueColor: AlwaysStoppedAnimation<Color>(
                    AppLightColors.white_color //<-- SEE HERE

                ),
                // strokeWidth: 5,
              ),
            ),
          ),
        ),
      )
    ],
  );
}

Future<bool?> flutterToast({msg}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,

      fontSize: 14);
}