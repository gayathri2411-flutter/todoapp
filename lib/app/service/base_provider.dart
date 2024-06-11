// ignore_for_file: unused_local_variable
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  BaseProvider() {
    httpClient.baseUrl = 'https://india.taxideals.online';
    const String apiKey = "HBNA19QVVAPP";

    httpClient.timeout = const Duration(seconds: 20);
  }
}
