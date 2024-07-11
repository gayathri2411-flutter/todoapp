 // ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:newuser/app/modules/forgotPassword/views/reset_password_view.dart';
import 'package:newuser/app/modules/side_menu/views/about_view.dart';
import 'package:newuser/app/modules/side_menu/views/favorite_view.dart';
import 'package:newuser/app/modules/side_menu/views/feedback_view.dart';
import 'package:newuser/app/modules/side_menu/views/help_view.dart';
import 'package:newuser/app/modules/side_menu/views/mytrip_view.dart';
import 'package:newuser/app/modules/side_menu/views/profile_view.dart';
import 'package:newuser/app/modules/side_menu/views/rateus_view.dart';
import 'package:newuser/app/modules/side_menu/views/settings_view.dart';
import 'package:newuser/app/modules/side_menu/views/share_view.dart';
import 'package:newuser/app/modules/side_menu/views/wallet_view.dart';

import '../modules/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/forgotPassword/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_otp_view_view.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register/views/signupview_view.dart';
import '../modules/side_menu/bindings/side_menu_binding.dart';
import '../modules/side_menu/views/side_menu_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_OTP,
      page: () => const RegisterOtpView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignupviewView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SIDE_MENU,
      page: () => const SideMenuView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.MYTRIP,
      page: () => MytripView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.RATEUS,
      page: () => const RateusView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.SHARE,
      page: () => const ShareView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => const LoginView(),
      binding: SideMenuBinding(),
    ),
  ];
}
