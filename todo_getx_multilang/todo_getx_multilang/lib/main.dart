import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './services/storage_service.dart';
import './contorller/settings_controller.dart';
import './contorller/todo_controller.dart';
import './translations/app_translations.dart';
import './ui/theme/app_theme.dart';
import './routes/app_pages.dart';
import './routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  Get.put(SettingsController(), permanent: true);
  Get.put(TodoController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<SettingsController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      translations: AppTranslations(),
      locale: settings.locale,
      fallbackLocale: const Locale('en', 'US'),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: settings.isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}
