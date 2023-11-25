import 'package:flutter/material.dart';
import 'package:kopi_tester_fe/presentation/view/check_beans/check_beans_view.dart';
import 'package:kopi_tester_fe/presentation/view/splash/splash_view.dart';

import '../presentation/view/get_started/get_started_view.dart';
import '../presentation/view/home/home_view.dart';
import '../presentation/view/home_screen/home_screen_view.dart';
import '../presentation/view/login/login_view.dart';
import '../presentation/view/profile/profile_view.dart';
import '../presentation/view/register/register_view.dart';

class RouteHelper {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashView(),
    'home': (context) => const HomeView(),
    'login': (context) => const LoginView(),
    'profile': (context) => const ProfileView(),
    'register': (context) => const RegisterView(),
    'home-screen': (context) => const HomeScreenView(),
    'get-started': (context) => const GetStartedView(),
    'check-beans': (context) => const CheckBeansView(),
  };
}
