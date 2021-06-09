import 'package:flutter/material.dart';
import 'package:my_app/app_routes.dart';
import 'package:my_app/modules/login/data/provider/login_cache_provider.dart';

class SplashScreen extends StatelessWidget {
  navigateNamedToHome(context) {
    String key = kLoginScreen;
    LoginCacheProvider loginCacheProvider = new LoginCacheProvider();
    if (loginCacheProvider.retrieveIsConnected() == true) {
      key = kHomeRoute;
    }
    Navigator.pushNamedAndRemoveUntil(context, key, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: Column(
              children: [
                InkWell(
                  onTap: () => navigateNamedToHome(context),
                  child: Image.asset('assets/images/logo.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Ma Calculatrice",
                    style: TextStyle(fontSize: 40.0),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
