import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';

toastify(String text){
  Fluttertoast.cancel();
  return Fluttertoast.showToast(msg: text);
}

Future getDeviceToken() async{
  String token="";
  await firebaseMessaging!.getToken().then((value) => {
    token=value!,
  });
  return token;     
}
