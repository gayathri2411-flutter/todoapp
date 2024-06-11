import 'package:newuser/app/modules/register/model/otp_submit_request.dart';
import 'package:newuser/app/modules/register/model/otp_submit_response.dart';
import 'package:newuser/app/modules/register/model/register_otp_request.dart';
import 'package:newuser/app/modules/register/model/register_otp_response.dart';
import 'package:newuser/app/modules/register/model/signup_request.dart';
import 'package:newuser/app/modules/register/model/signup_response.dart';
import 'package:newuser/app/service/provider.dart';

class SignUpRepository {
  final Provider provider;

  SignUpRepository({required this.provider});
  Future<RegisterOtpResponse> registerOtp(
          {required RegisterOtpRequest request}) async =>
      await provider.registerOtp(request: request);
  Future<OtpSubmitResponse> otpSubmit(
          {required OtpSubmitRequest request}) async =>
      await provider.otpSubmit(request: request);
  Future<SignUpResponse> signUp({required SignUpRequest request}) async =>
      await provider.signUp(request: request);
}
