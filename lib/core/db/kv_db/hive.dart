import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract interface class HiveDatabase {
  HiveDatabase();

  static late final Box<bool> _appInfo;

  static Future<void> init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    _appInfo = await Hive.openBox<bool>('app_info');
  }

  static Future<void> cacheTheAppIsOpened() async {
    return _appInfo.put('first_time_openedApp', false);
  }

  static bool firstTimeOpenedApp() {
    return _appInfo.get('first_time_openedApp', defaultValue: true) ?? true;
  }
}
