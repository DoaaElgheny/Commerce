import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../base/auth.dart';

final class HiveAuthenticationCache implements AuthenticationCache {
  factory HiveAuthenticationCache() {
    return _singleton;
  }

  HiveAuthenticationCache._internal();

  static final _singleton = HiveAuthenticationCache._internal();

  late final Box<String> _box;

  static const _boxName = 'auth_cache';
  static const _tokenKey = 'api_token';

  @override
  Future<void> init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    _box = await Hive.openBox<String>(_boxName);
  }

  @override
  Future<void> cacheToken({required String token}) async {
    return _box.put(_tokenKey, token);
  }

  @override
  Future<String?> cachedToken() async {
    return _box.get(_tokenKey);
  }

  @override
  Future<void> destroyToken() async {
    return _box.delete(_tokenKey);
  }
}
