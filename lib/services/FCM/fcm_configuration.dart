import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bomjour/services/notification/notifications_services.dart';
import 'package:bomjour/utils/app_constants/api_constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';









class TokenMonitor extends StatefulWidget {
  TokenMonitor(this._builder);
  final Widget Function(String? token) _builder;
  @override
  State<StatefulWidget> createState() => _TokenMonitor();
}

class _TokenMonitor extends State<TokenMonitor> with WidgetsBindingObserver {
  String? _token;
  late Stream<String> _tokenStream;



  void setToken(String? token) {
    print('FCM Token: $token');
    setState(() {
      _token = token;
      ApiConstant.FCM_TOKEN = token!;
    });
  }

  AppLifecycleState? _notification;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    String? notificationID;
    String? notificationType;

    if (state != AppLifecycleState.inactive &&
        state != AppLifecycleState.paused) {
      NotificationService().clearAllNotifications();
    }
    if (state == AppLifecycleState.resumed) {

    }
  }

  getFCMToken() {
    FirebaseMessaging.instance
        .getToken(
        vapidKey:
        'BNl1UPJuElEi8OjQf8Raay9FS6XIeTv3zcAy4-sTiRe-H4lC_m8mXxUkvtF65SHEUPMw__QFKOphGr8oV9O_Hq8')
        .then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);
  }


  @override
  void initState() {
    NotificationService().clearAllNotifications();
    WidgetsBinding.instance.addObserver(this);

    super.initState();
    getFCMToken();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) async {
      if (message != null) {



        log("Hmazaaa");

        print("Notification Data: ${message.data}");
        log("Notifications getInitialMessage: " + message.data.toString());

        // final jsonMap =  jsonDecode(message.data['body']);
        // final notificationId = jsonMap['notification_id'];
        // final slug = jsonMap['slug'];
        // final type = message.data['type'];

      }

    });
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        badge: true, alert: true, sound: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("Notification Data: ${message.data}");
      log("Notifications onAppOnForeground: " + message.data.toString());
      log("Hmazaaa");

      log(message.data.toString());



      showFlutterNotification(message: message, paylod: message.notification!.body.toString());

    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      log("Notifications onMessageOpenedApp: " + message.data.toString());
      if (message != null) {

        log("Notifications getInitialMessage: ${message.notification}");



        // final notificationId = jsonMap['notification_id'];
        // final slug = jsonMap['slug'];
        // final type = message.data['type'];

        // if (type == "USER_BLOCKED") {
        //
        // }


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget._builder(_token);
  }
}

  Future<void> setupFlutterNotifications({bool isBack = false}) async {
    if (Platform.isIOS) {
      await Firebase.initializeApp(

          options: const FirebaseOptions(
              apiKey: "AIzaSyB7s-m6WJMpf8TopRyhpWFzPwnZE4ynXug",
              appId: "1:863960907293:ios:e604dd44b67ea480d1d0f4",
              messagingSenderId: "863960907293",
              projectId: "bomjourconsumer"));
      FirebaseMessaging.instance.requestPermission();
    } else {
      await Firebase.initializeApp();
    }
    if(isBack == false){
      FirebaseMessaging.instance.requestPermission();
    }
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await setupFlutterNotifications(isBack: true);
    if (Platform.isIOS) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyB7s-m6WJMpf8TopRyhpWFzPwnZE4ynXug",
              appId: "1:863960907293:ios:e604dd44b67ea480d1d0f4",
              messagingSenderId: "863960907293",
              projectId: "bomjourconsumer"));
      FirebaseMessaging.instance.requestPermission();
    } else {
      await Firebase.initializeApp();
    }
    // if(message.notification?.title=="Created"){
    //
    //   Get.put(HomeController())
    //       .getAppointData(id: Get.find<HomeController>().idEmp.value,status: "Appointment Booked");
    // }
   //  showFlutterNotification(message: message, paylod: "");
    print("this is background ${message.notification?.body}");

  }

  void showFlutterNotification({required RemoteMessage message, required String paylod}) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      NotificationService().showNotifications(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          payload: paylod);
    }
    debugPrint("this is data ${message.notification?.body}");

  }






class CustomNavigation extends StatefulWidget {
  String? slug;
  String? notificationId;
  CustomNavigation({Key? key, this.slug, this.notificationId}) : super(key: key);

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      if (mounted) {

      }
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}