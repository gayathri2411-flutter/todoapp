import 'package:newuser/app/modules/login/model/login_request.dart';
import 'package:newuser/app/modules/login/model/login_response.dart';
import 'package:newuser/app/service/provider.dart';

class LoginRepository {
  final Provider provider;

  LoginRepository({required this.provider});
  Future<LoginResponse> login({required LoginRequest request}) async =>
      await provider.login(request: request);
}
