// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bomjour/app_module/authentication/controller/auth_controller.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';




class AuthenticationHelper {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoggin = false;

  var facebookLogin = FacebookAuth.i;

  Future facebookSignIn({required BuildContext context}) async {
    final authController =
    Provider.of<AuthenticationController>(context, listen: false);
    var data;
    try {
    var _result = await facebookLogin.login(
      permissions: [
        'email',
        'public_profile',
      ],
    );
    log(_result.message.toString());

    switch (_result.status) {
      case LoginStatus.cancelled:

        log("This is error ${_result.toString()}");
        log("This is error ${_result.message.toString()}");
        log("Canceled By User");
        break;

    case LoginStatus.operationInProgress:
      log("in progress");
      break;

      case LoginStatus.success:
        FacebookAuth.i.getUserData(
          fields: "name,email,picture.width(200)",
        );

        AuthCredential _credentials = FacebookAuthProvider.credential(
            _result.accessToken!.token.toString());

        var a = await FirebaseAuth.instance
            .signInWithCredential(_credentials)
            .catchError((e) {
          log(e.toString());
        });

        data = a;
        final String? email = a.user?.email.toString();
        final String? name = a.user?.displayName;
        final String gid = a.user!.uid;
        debugPrint("This is user facebook ${a.user?.email.toString()}");
        debugPrint("This is name ${a.user?.providerData[0].displayName}");
        debugPrint("This is email ${a.user?.providerData[0].email}");


        // final String ?pic=user.photoURL;

        debugPrint(name);
        debugPrint(email);

        authController.updateSocialLoginLoader(false);
        ApiManger().socialLogin(
            email: email.toString(),
            type: "facebook",
            context: context,
            name: name.toString(),
            tokenAuth:gid



        );

        debugPrint("hhh $email");
        debugPrint(name);
        debugPrint(gid);

        //   // pr

        log(a.user!.displayName.toString());
        //  user =a.user;

        log("User id for fb " + a.user!.uid.toString());
        break;

      default:

      // userData = requestData;
      // log(jsonEncode(userData));

    }

    log(_result.status.toString());
    log("This is status of error");



    return null;
    } on FirebaseAuthException catch (e) {
      authController.updateSocialLoginLoader(false);
      return e.message;
    }
  }

  Future<void> googlebySignIn({required BuildContext context}) async {
    final authController =
    Provider.of<AuthenticationController>(context, listen: false);
    try {
      var data;
      await googleSignIn.signOut(); // Sign out first if needed

      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final result = await _auth.signInWithCredential(credential);
      User? user = result.user;
      final String? email = user?.providerData.first.email;
      final String? name = user?.displayName;
      final String? number = user?.phoneNumber;
      final String? photo = user?.photoURL;
      final String gid = user!.uid;

      debugPrint("hhh $email");
      debugPrint(name);
      debugPrint(gid);
      debugPrint(photo);
      debugPrint(number);
      authController.updateSocialLoginLoader(false);
      ApiManger().socialLogin(
          email: email.toString(),
          type: "google",
          context: context,
          name: name.toString(),
          tokenAuth:gid



      );

      // Handle any specific errors here if needed
    } catch (e) {
      authController.updateSocialLoginLoader(false);
      flutterToast(msg: "Something went wrong");
      // Handle the error
      debugPrint("Error: $e");
      // You can also return an error message or throw the error if needed
      return;
    }
  }



}




