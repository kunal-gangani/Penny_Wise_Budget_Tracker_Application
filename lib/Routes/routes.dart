import 'package:budget_tracker_app/Views/HomePage/home_page.dart';
import 'package:budget_tracker_app/Views/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String splashScreen = '/';
  static String homePage = '/home';

  static List<GetPage> myRoutes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
    ),
  ];
}
