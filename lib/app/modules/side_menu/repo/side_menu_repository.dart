import 'package:newuser/app/modules/home/model/profile_details_response.dart';
import 'package:newuser/app/modules/side_menu/model/feedback_request.dart';
import 'package:newuser/app/modules/side_menu/model/feedback_response.dart';
import 'package:newuser/app/modules/side_menu/model/get_profile_response.dart';
import 'package:newuser/app/modules/side_menu/model/logout_response.dart';
import 'package:newuser/app/modules/side_menu/model/trip_history_response.dart';
import 'package:newuser/app/service/provider.dart';

class SideMenuRepository {
  final Provider provider;

  SideMenuRepository({required this.provider});
  Future<FeedBackResponse> feedback({required FeedBackRequest request}) async =>
      await provider.feedback(request: request);
      Future<GetProfileDetailsResponse> getProfile() async =>
      await provider.getProfile();
      Future<TripHistoryResponse> tripHistory() async =>
      await provider.tripHistory();
        Future<LogoutResponse> logout() async =>
      await provider.logout();
       Future<Profile_Details_Response> profileUpdate({required request}) async =>
      await provider.profileUpdate(request: request);
}
