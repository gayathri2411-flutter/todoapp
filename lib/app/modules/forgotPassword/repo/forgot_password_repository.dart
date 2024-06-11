import 'package:newuser/app/modules/forgotPassword/model/forgot_password_otp_request.dart';
import 'package:newuser/app/modules/forgotPassword/model/forgot_password_otp_response.dart';
import 'package:newuser/app/modules/register/model/otp_submit_request.dart';
import 'package:newuser/app/modules/register/model/otp_submit_response.dart';
import 'package:newuser/app/service/provider.dart';

class ForgotPasswordRepository {
  final Provider provider;

  ForgotPasswordRepository({required this.provider});
  Future<ForgotPasswordResponse> forgotpasswordOtp(
          {required ForgotPasswordRequest request}) async =>
      await provider.forgotpasswordOtp(request: request);

  Future<OtpSubmitResponse> resetPassword(
          {required OtpSubmitRequest request}) async =>
      await provider.resetPassword(request: request);
}
