import 'package:my_app/core/cache/file_cache_helper.dart';

class LoginCacheProvider {
  final FileCacheHelper _helper = FileCacheHelper();

  Future saveIsConnected(bool result) async {
    String save = '0';
    if (result) {
      save = '1';
    }
    await _helper.save('IsConnected', save);
    return;
  }

  Future<bool> retrieveIsConnected() async {
    try {
      final String response = await _helper.read('IsConnected');
      if (response != null) {
        return response == '1' ? true : false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
