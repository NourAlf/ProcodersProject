import 'dart:async';

class Data {
  static bool isLogin = false;
  static String token ="";
  static String map_apiKey="";


  //mid level security : refresh token :
static Future<void> tokenUpdate() async {

}
Future<void>  startTokenUpDate() async{
  Timer.periodic(Duration(seconds: 30), (timer) {
    tokenUpdate();
  });

}

}