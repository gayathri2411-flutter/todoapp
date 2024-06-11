import 'package:newuser/app/modules/home/model/create_ride_response.dart';
import 'package:newuser/app/service/api_end_points.dart';
import 'package:newuser/app/service/base_provider.dart';

import '../modules/home/model/create_ride_request.dart';

class RideProvider extends BaseProvider{
  Future<CreateRideResponse> createRide({required CreateRideRequest request}) async{
      try {
        final response=await post(ApiEndPoints.ENDPOINT_RIDE_CREATE, request.toJson(),headers: {"Content-Type": "application/json"});
        if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return CreateRideResponse.fromJson(response.body);
      } 
      } catch (exception) {
        rethrow;
      }
  }
}