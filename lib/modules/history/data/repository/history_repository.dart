import 'package:my_app/modules/history/data/provider/history_cache_provider.dart';

class HistoryRepository {
  final _historyCache = HistoryCacheProvider();

  Future saveResult(double result) async {
    await _historyCache.saveLastResul(result);
  }

  Future<String> retrieve() async {
    return await _historyCache.retrieveLastResult();
  }
}
