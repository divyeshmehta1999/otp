import 'package:get/get.dart';

import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/SPLASH/bindings/splash_binding.dart';
import '../modules/SPLASH/views/splash_view.dart';
import '../modules/chatscreen/bindings/chatscreen_binding.dart';
import '../modules/chatscreen/views/chatscreen_view.dart';
import '../modules/chatview/bindings/chatview_binding.dart';
import '../modules/chatview/views/chatview_view.dart';

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
      page: () => OTPLoginScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CHATSCREEN,
      page: () => const ChatscreenView(),
      binding: ChatscreenBinding(),
    ),
    GetPage(
      name: _Paths.CHATVIEW,
      page: () => const ChatviewView(),
      binding: ChatviewBinding(),
    ),
  ];
}
