import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationServices {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> addDeviceToken(String userId, String token) async {
    try {
      CollectionReference<Map<String, dynamic>> deviceTokenCollection =
          FirebaseFirestore.instance.collection('deviceToken');

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await deviceTokenCollection.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isEmpty) {
        // Token does not exist, add a new document
        await deviceTokenCollection.add({
          'userId': userId,
          'deviceToken': token,
          'DateTime': DateTime.now(),
        });

        print('Token added Successfully');
      } else {
        // Token already exists, update the existing document
        String existingDocumentId = querySnapshot.docs.first.id;

        await deviceTokenCollection.doc(existingDocumentId).update({
          'deviceToken': token,
          'DateTime': DateTime.now(),
        });

        print('Token updated Successfully');
      }
    } catch (error) {
      print('Failed to Add/Update Token: $error');
    }
  }

  Future<void> requestNotificationPermission() async {
    try {
      // Requesting notification permissions
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        provisional: true,
        carPlay: true,
        criticalAlert: true,
        sound: true,
      );

      // Checking the authorization status after the request
      String permissionStatus =
          _getPermissionStatus(settings.authorizationStatus);
      print('User $permissionStatus permission');
    } catch (e) {
      print('Error requesting notification permission: $e');
    }
  }

  String _getPermissionStatus(AuthorizationStatus status) {
    switch (status) {
      case AuthorizationStatus.authorized:
        return 'granted';
      case AuthorizationStatus.provisional:
        return 'granted provisional';
      default:
        return 'not granted';
    }
  }

  Future<void> inItLocalNotification(BuildContext context) async {
    var androidInitialization =
        const AndroidInitializationSettings('assets/logo.png');
    var iosInitialization = const DarwinInitializationSettings();
    var initializationSetting = InitializationSettings(
      android: androidInitialization,
      iOS: iosInitialization,
    );

    // Create a single notification channel during initialization
    await flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payLoad) {},
    );

    // Create a high importance channel
    await _createHighImportanceChannel();
  }

  Future<void> _createHighImportanceChannel() async {
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notification',
      importance: Importance.max,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      Random.secure().nextInt(10000).toString(),
      'High Importance Notification',
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      category: AndroidNotificationCategory.message,
    );

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    // Create actions for "Accept" and "Reject"

    Future.delayed(Duration.zero, () async {
      flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.title.toString(),
        notificationDetails,
      );
    });
  }

  Future<String> getDeviceToken() async {
    String? token = await _firebaseMessaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    _firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refresh');
      }
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }
      showNotification(message);
    });
  }

  void handleAction() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the FCM message, including the custom action data
      String? action = message.data['action'];

      if (action != null) {
        if (action == 'Accept') {
          print('Your Notification is accepted');
          // Perform the logic for accepting the notification
        } else if (action == 'Reject') {
          print('Your Notification is rejected');
          // Perform the logic for rejecting the notification
        }
      }
    });
  }

  Future<void> saveUserId(String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userId", userId);
  }

  Future<void> storeNotification(
      String tittle, body, receiverToken, timeStamp) async {
    try {
      FirebaseFirestore.instance.collection('Notifications').add({
        'tittle': tittle,
        'body': body,
        'receiverToken': receiverToken,
        'TimeStamp': timeStamp
      });
    } catch (e) {
      print('An Error ${e.toString()}');
    }
  }

}
