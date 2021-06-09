import 'package:my_app/modules/login/data/provider/login_cache_provider.dart';

class LoginRepository {
  final _loginCache = LoginCacheProvider();

  Future saveResult(bool result) async {
    await _loginCache.saveIsConnected(result);
  }

  Future<bool> retrieve() async {
    return await _loginCache.retrieveIsConnected();
  }
}
