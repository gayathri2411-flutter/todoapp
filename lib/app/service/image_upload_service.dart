import 'dart:io';
import 'package:http/http.dart' as http;

class ImageUploadService {
  static const String baseUrl = 'https://india.taxideals.online';

  Future<void> uploadFile(
      File file, String driverName, String type, String userId) async {
    try {
      final url = Uri.parse(
          '$baseUrl/driver-photo?driver_name=$driverName&type=PROFILE&userId=$userId');
      var request = http.MultipartRequest('POST', url);
      request.files.add(
        http.MultipartFile(
          'image',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path.split('/').last,
        ),
      );

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // Check the response
      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Error uploading file: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error uploading file: $e');
    }
  }
}
