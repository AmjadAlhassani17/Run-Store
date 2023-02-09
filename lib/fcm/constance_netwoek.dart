
abstract class ConstantsNetwork {

  static String baseUrl = "https://fcm.googleapis.com/fcm/send";

  static Map<String, dynamic> notificationHeader = {
    'Content-Type': 'application/json',
    'Authorization': 'key=AAAAy_485Vk:APA91bH_d9NuKxr09ZGC3nTfMS-pbIwUZtiqVOoQrHaozjwciTIHMboMjrN57r4D9Efa4MZU3-LxmEJaZIc7DVEPq1QUWcfEwJolEgipYtO7T-DR2gHtGQZeO_Hb87Qf8i7aU7pHIfVG'
  };

  static var notification = "notification";
  static var body = "body";
  static var title = "title";
  static var topic = "/topics/";
  static var to = "to";
  static var data = "data";
  static var image = "image";
  static var senderAvatar = "avatar";
  static var route = "route";
  static var type = "type";
  static var contentType = "type";

}
