import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:runstore/utils/utils.dart';

import '../utils/constants.dart';
import 'constance_netwoek.dart';

class NotificationService {
  NotificationService._();

  static NotificationService instance = NotificationService._();

  init() {
    configuration();
    registerNotification();
    getTokenFCM();
    // onTokenRefresh();
  }

  ValueNotifier<int> notificationCounterValueNotifer = ValueNotifier(0);
  MethodChannel platform =
      const MethodChannel('anawajha.dev/flutter_local_notifications_pool_ride');
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  RemoteMessage messages = const RemoteMessage();
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'private_chat_notification_channel', // id
    'Chats', // title
    importance: Importance.max,
    showBadge: true,
  );

  void updatePages(RemoteMessage message) async {
    debugPrint(message.data.toString());
  }

  configuration() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      'mipmap/ic_launcher',
    );
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
    final notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      await selectNotification(notificationAppLaunchDetails?.payload);
    }
  }

  Future selectNotification(String? payload) async {
    try {
      debugPrint(messages.toString());
      // goToOrderPage(messages.data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void registerNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      
        await messageHandler(message);
      
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      if (Constant.lastNotificationId == message.notification.hashCode) {
        await messageHandler(message);
      }
    });
  }

  int? lastMessageId;
  
  Future<void> messageHandler(RemoteMessage message,
      {bool isBackground = false}) async {
    RemoteNotification notification = message.notification!;
    var d = message.data;
    debugPrint(d.toString());

    String? imagePath = message.data[ConstantsNetwork.image] != null
        ? await Utils.instance.download(message.data[ConstantsNetwork.image])
        : null;
    ByteArrayAndroidBitmap? largeIcon = imagePath != null
        ? ByteArrayAndroidBitmap.fromBase64String(
            Utils.instance.getBase64FormateFile(imagePath),
          )
        : null;

    String? senderAvatarPath =
        message.data[ConstantsNetwork.senderAvatar] != null
            ? await Utils.instance.download(message.data[ConstantsNetwork.senderAvatar])
            : null;
    ByteArrayAndroidIcon? senderAvatar = senderAvatarPath != null
        ? ByteArrayAndroidIcon.fromBase64String(
            Utils.instance.getBase64FormateFile(senderAvatarPath),
          )
        : null;

    if (Platform.isIOS || Platform.isAndroid) {
      messages = message;
      updatePages(message);
      if (!isBackground) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            iOS: const IOSNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
            android: AndroidNotificationDetails(
              largeIcon: largeIcon,
              channel.id,
              channel.id,
              channelAction: AndroidNotificationChannelAction.update,
              styleInformation: MessagingStyleInformation(
                  Person(
                    name: notification.title,
                  ),
                  conversationTitle: 'New message from',
                  messages: [
                    Message(
                      notification.body!,
                      message.sentTime!,
                      Person(
                          name: notification.title,
                          icon: senderAvatarPath != null ? senderAvatar : null),
                    ),
                  ],
                  groupConversation: true),
              enableLights: true,
              enableVibration: true,
              fullScreenIntent: true,
              autoCancel: true,
              importance: Importance.max,
              priority: Priority.max,
            ),
          ),
          payload: "${message.data}",
        );
      }
    }
  }

  void getTokenFCM() async {
    await _firebaseMessaging.getToken().then((token) async {
      debugPrint('token fcm : $token');
    }).catchError((err) {
      debugPrint(err.toString());
    });
  }

  // void onTokenRefresh() {
  //   FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
  //     await FirebaseFirestore.instance
  //         .collection(Constants.usersCollection)
  //         .doc(FirebaseAuth.instance.currentUser?.uid)
  //         .update({UserModel.tokenKey: token});
  //   });
  // }

  void subscribeToTopic({required String topic}) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  void unsubscribeToTopic({required String topic}) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  // static void goToOrderPage(Map<String, dynamic> map) async {
  //   if (map[ConstantsNetwork.route] != null) {
  //     await FirebaseFirestore.instance
  //         .collection(Constants.usersCollection)
  //         .doc(map[ConstantsNetwork.route])
  //         .get()
  //         .then((value) {
  //       if (value.exists) {
  //         Get.put(PrivateChatViewModel(), permanent: true);
  //         Get.to(() => PrivateChatScreen(
  //             userModel: UserModel.fromDocumentSnapshot(value)));
  //       }
  //     });
  //   }
  // }

}
