import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  // Keys
  static const String keyTodos = 'todos';
  static const String keyIsDark = 'isDark';
  static const String keyLocale = 'locale'; // e.g. "en_US"

  // Generic read/write helpers
  static T? read<T>(String key) => _box.read<T>(key);
  static Future<void> write(String key, dynamic value) => _box.write(key, value);
}
