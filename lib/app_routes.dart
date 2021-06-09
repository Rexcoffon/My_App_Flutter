import 'package:flutter/material.dart';
import 'package:my_app/app/screens/history-details/history_datails_screen.dart';
import 'package:my_app/app/screens/history/history_screen.dart';
import 'package:my_app/app/screens/home/home_screen.dart';
import 'package:my_app/app/screens/login/login_screen.dart';
import 'package:my_app/app/screens/scan/scan_screen.dart';
import 'package:my_app/app/screens/splash/splash_screen.dart';

const kMainRoute = '/';
const kHomeRoute = '/home';
const kHistoryRoute = '/History';
const kLoginScreen = '/login';
const kHistoryDetailsRoute = '/history-details';
const kScanRoute = '/scan';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => SplashScreen(),
  kHomeRoute: (_) => HomeScreen(),
  kHistoryRoute: (_) => HistoryScreen(),
  kLoginScreen: (_) => LoginScreen(),
  kScanRoute: (_) => ScanScreen(),
};
onGenerateRoute(settings) {
  if (settings.name == kHistoryDetailsRoute) {
    List<String> arg = settings.arguments;
    return MaterialPageRoute(
        builder: (_) => HistoryDetailsScreen(result: arg[0], date: arg[1]));
  } else if (settings.name != null)
    return MaterialPageRoute(builder: kRoutes[settings.name]);
  else
    return null; //define for other screens
}
