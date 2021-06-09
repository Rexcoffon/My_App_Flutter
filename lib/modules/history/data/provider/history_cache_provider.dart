import 'package:my_app/core/cache/file_cache_helper.dart';

class HistoryCacheProvider {
  final FileCacheHelper _helper = FileCacheHelper();

  Future saveLastResul(double result) async {
    await _helper.save('last_result', result.toString());
    return;
  }

  Future<String> retrieveLastResult() async {
    try {
      final String response = await _helper.read('last_result');
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
