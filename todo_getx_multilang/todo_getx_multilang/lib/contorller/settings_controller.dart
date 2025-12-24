import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/storage_service.dart';

class SettingsController extends GetxController {
  bool get isDark => StorageService.read<bool>(StorageService.keyIsDark) ?? false;

  Locale get locale {
    final saved = StorageService.read<String>(StorageService.keyLocale) ?? 'en_US';
    final parts = saved.split('_');
    return Locale(parts[0], parts.length > 1 && parts[1].isNotEmpty ? parts[1] : null);
  }

  void toggleTheme() {
    final newVal = !isDark;
    StorageService.write(StorageService.keyIsDark, newVal);
    Get.changeThemeMode(newVal ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  void changeLocale(Locale l) {
    final code = '${l.languageCode}_${l.countryCode ?? ""}';
    StorageService.write(StorageService.keyLocale, code);
    Get.updateLocale(l);
    update();
  }
}
