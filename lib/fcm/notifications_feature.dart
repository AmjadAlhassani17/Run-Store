import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:runstore/fcm/constance_netwoek.dart';
import '../network/dio_manage_class.dart';

class NotificationFeature {
  NotificationFeature._();

  static final NotificationFeature getInstance = NotificationFeature._();

  Future<void> sendMessagetoTopic(
      {required String topic,
      required String title,
      required String body,
      Map<String,dynamic>? data}) async {
    await DioManagerClass.getInstance.dioPostMethod(
        url: ConstantsNetwork.baseUrl,
        header: ConstantsNetwork.notificationHeader,
        body: {
          ConstantsNetwork.notification: {
            ConstantsNetwork.body: body,
            ConstantsNetwork.title: title,
          },
          ConstantsNetwork.to : '${ConstantsNetwork.topic}$topic',
          ConstantsNetwork.data : data,
        });
  }

  
 Future<void> sendMessageToToken(
      {String? token,
      required String title,
      required String body,
      Map<String,dynamic>? data}) async {
         token = await getToken();
    await DioManagerClass.getInstance.dioPostMethod(
        url: ConstantsNetwork.baseUrl,
        header: ConstantsNetwork.notificationHeader,
        body: {
          ConstantsNetwork.notification: {
            ConstantsNetwork.body: body,
            ConstantsNetwork.title: title,
          },

          ConstantsNetwork.to: token,
          ConstantsNetwork.data : data,
        });
  }
  
  Future<String> getToken() async {
    return await FirebaseMessaging.instance.getToken() ?? '';
  }

}

