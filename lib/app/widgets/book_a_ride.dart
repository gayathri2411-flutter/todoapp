import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newuser/main.dart';

Future bookCab(request) async{
  const url="https://fcm.googleapis.com/fcm/send";
  final response=await http.post(Uri.parse(url),body: jsonEncode(request),headers: {
    "Content-Type":"Application/json",
    "Authorization":"key=$fcmToken"
  });
  if(response.statusCode==200){
    return true;
  }
}