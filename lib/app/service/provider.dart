import 'package:get_storage/get_storage.dart';
import 'package:newuser/app/modules/forgotPassword/model/forgot_password_otp_request.dart';
import 'package:newuser/app/modules/forgotPassword/model/forgot_password_otp_response.dart';
import 'package:newuser/app/modules/forgotPassword/model/forgotpassword_resendOtp_request.dart';
import 'package:newuser/app/modules/forgotPassword/model/forgotpassword_resendOtp_response.dart';
import 'package:newuser/app/modules/home/model/adSearchV1Request.dart';
import 'package:newuser/app/modules/home/model/adSearchV1Response.dart';
import 'package:newuser/app/modules/home/model/adSearchV2Request.dart';
import 'package:newuser/app/modules/home/model/adSearchV2Response.dart';
import 'package:newuser/app/modules/home/model/booking_request.dart';
import 'package:newuser/app/modules/home/model/booking_response.dart';
import 'package:newuser/app/modules/home/model/price_calculation_request.dart';
import 'package:newuser/app/modules/home/model/price_calculation_response.dart';
import 'package:newuser/app/modules/home/model/profile_details_response.dart';
import 'package:newuser/app/modules/home/model/search_cab_request.dart';
import 'package:newuser/app/modules/home/model/search_cab_response.dart';
import 'package:newuser/app/modules/home/model/userDetails_response.dart';
import 'package:newuser/app/modules/login/model/login_request.dart';
import 'package:newuser/app/modules/login/model/login_response.dart';
import 'package:newuser/app/modules/register/model/otp_submit_request.dart';
import 'package:newuser/app/modules/register/model/otp_submit_response.dart';
import 'package:newuser/app/modules/register/model/register_otp_request.dart';
import 'package:newuser/app/modules/register/model/register_otp_response.dart';
import 'package:newuser/app/modules/register/model/signup_request.dart';
import 'package:newuser/app/modules/register/model/signup_response.dart';
import 'package:newuser/app/modules/side_menu/model/feedback_request.dart';
import 'package:newuser/app/modules/side_menu/model/feedback_response.dart';
import 'package:newuser/app/modules/side_menu/model/get_profile_response.dart';
import 'package:newuser/app/modules/side_menu/model/logout_response.dart';
import 'package:newuser/app/modules/side_menu/model/profile_update_request.dart';
import 'package:newuser/app/modules/side_menu/model/trip_history_response.dart';
import 'package:newuser/app/service/api_end_points.dart';
import 'package:newuser/app/service/base_provider.dart';
import 'package:newuser/app/widgets/shared_functions.dart';

class Provider extends BaseProvider {
  Future<RegisterOtpResponse> registerOtp(
      {required RegisterOtpRequest request}) async {
    try {
      final response = await post(
          ApiEndPoints.ENDPOINT_OTP_REQ, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return RegisterOtpResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<OtpSubmitResponse> otpSubmit(
      {required OtpSubmitRequest request}) async {
    try {
      final response = await post(
          ApiEndPoints.ENDPOINT_VALIDATE_OTP_REQ, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return OtpSubmitResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<SignUpResponse> signUp({required SignUpRequest request}) async {
    try {
      final response = await post(
          ApiEndPoints.ENDPOINT_SIGNUP_REQ, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return SignUpResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<LoginResponse> login({required LoginRequest request}) async {
    try {
      final response = await post(
          ApiEndPoints.ENDPOINT_SERVER_LOGIN, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return LoginResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<ForgotPasswordResponse> forgotpasswordOtp(
      {required ForgotPasswordRequest request}) async {
    try {
      final response = await post(
          ApiEndPoints.FORGET_PASSWORD_REQ_OTP, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return ForgotPasswordResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<ForgotPasswordResendOtpResponse> forgotpasswordResendOtp(
      {required ForgotPasswordResendOtpRequest request}) async {
    try {
      final response = await post(
          ApiEndPoints.FORGET_PASSWORD_REQ_OTP, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return ForgotPasswordResendOtpResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<OtpSubmitResponse> resetPassword(
      {required OtpSubmitRequest request}) async {
    try {
      final response = await post(
          ApiEndPoints.INDIA_FORGOT_SMS, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return OtpSubmitResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<UserDetailsResponse> userDetails() async {
    var id = GetStorage().read('id');
    try {
      final response = await get(
          "${ApiEndPoints.ENDPOINT_SERVER_UserDetails}$id",
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return UserDetailsResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Profile_Details_Response> profileDetails() async {
    var id = GetStorage().read('id');
    try {
      final response = await get(
          "${ApiEndPoints.ENDPOINT_SERVER_CheckUserImage}$id",
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Profile_Details_Response.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<GetProfileDetailsResponse> getProfile() async {
    var id = GetStorage().read('id');
    try {
      final response = await get(
          "${ApiEndPoints.ENDPOINT_SERVER_CheckUserImage}$id",
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return GetProfileDetailsResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<TripHistoryResponse> tripHistory() async {
    var id = GetStorage().read('id');
    try {
      final response = await get("${ApiEndPoints.ENDPOINT_TRIP_HISTORY}/$id",
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return TripHistoryResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<FeedBackResponse> feedback({required FeedBackRequest request}) async {
    try {
      final response = await post(
          ApiEndPoints.ENDPOINT_FEEDBACK, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return FeedBackResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Profile_Details_Response> profileUpdate(
      {required Profile_Update_Request request}) async {
    try {
      final response = await post(
          ApiEndPoints.ENDPOINT_SERVER_ProfileUpdate, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Profile_Details_Response.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<LogoutResponse> logout() async {
    var id = GetStorage().read('id');
    try {
      final response = await get(
        "${ApiEndPoints.ENDPOINT_LOGOUT}/$id/LOGOUT",
      );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return LogoutResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<AdvanceSearch_v1_Response> advanceSearchV1(
      {required AdvanceSearch_v1_Request request}) async {
    try {
      final response = await post(ApiEndPoints.SEARCH_API, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return AdvanceSearch_v1_Response.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
  Future<PriceCalculationResponse> priceCalculation({required PriceCalculationRequest request}) async{
        try {
          final response=await post(ApiEndPoints.PRICE_CALCULATION, request.toJson(),
          headers: {"Content-Type": "application/json"}
          );
          if(response.status.hasError){
            return Future.error(response.statusText!);
          }
          else{
            return PriceCalculationResponse.fromJson(response.body);
          }
        } catch (exception) { 
          return Future.error(exception.toString());
        }
  }
  Future<SearchCabResponse> advanceSearchV2(
      {required SearchCabRequest request}) async {
    try {
      final response = await post(ApiEndPoints.SEARCH_API, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return SearchCabResponse.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
  
  Future<Booking_Response> booking(
      {required Booking_Request request}) async {
    try {
      final response = await post(ApiEndPoints.BOOKING_API, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Booking_Response.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
