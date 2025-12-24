import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../contorller/settings_controller.dart';
import '../../contorller/todo_controller.dart';
// ignore: unused_import
import '../../translations/app_translations.dart';
import '../../routes/app_routes.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<SettingsController>();
    final todos = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr),
        actions: [
          // Theme toggle
          IconButton(
            tooltip: 'theme'.tr,
            icon: const Icon(Icons.brightness_6),
            onPressed: settings.toggleTheme,
          ),
          // Language picker
          PopupMenuButton<String>(
            tooltip: 'language'.tr,
            onSelected: (v) {
              switch (v) {
                case 'en':
                  settings.changeLocale(const Locale('en', 'US'));
                  break;
                case 'de':
                  settings.changeLocale(const Locale('de', 'DE'));
                  break;
                case 'gu':
                  settings.changeLocale(const Locale('gu', 'IN'));
                  break;
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'en', child: Text('English')),
              PopupMenuItem(value: 'de', child: Text('Deutsch')),
              PopupMenuItem(value: 'gu', child: Text('ગુજરાતી')),
            ],
            icon: const Icon(Icons.language),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Obx(() {
        if (todos.todos.isEmpty) {
          return Center(child: Text('empty'.tr));
        }
        return ListView.builder(
          itemCount: todos.todos.length,
          itemBuilder: (_, i) => TodoTile(todo: todos.todos[i]),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.ADD_EDIT),
        icon: const Icon(Icons.add),
        label: Text('add_todo'.tr),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton.icon(
            onPressed: todos.clearCompleted,
            icon: const Icon(Icons.cleaning_services),
            label: Text('clear_completed'.tr),
          ),
        ),
      ),
    );
  }
}
