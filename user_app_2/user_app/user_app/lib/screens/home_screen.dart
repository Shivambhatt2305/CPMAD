import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/screens/color_screen.dart';
import 'package:user_app/l10n/app_localizations.dart';
import 'package:user_app/screens/services/theme_service.dart';
import 'package:user_app/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
        drawer: _buildDrawer(context),
        body: TabBarView(
          children: [
            ColorScreen(),
            Container(child: Text('Person')),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: AppLocalizations.of(context)!.home),
            Tab(icon: Icon(Icons.person), text: AppLocalizations.of(context)!.person),
            Tab(icon: Icon(Icons.settings), text: AppLocalizations.of(context)!.settings),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    var themeService = Provider.of<ThemeService>(context);
    return Drawer(
      child: ListView(
        children: [
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.darkMode),
            value: themeService.isDark,
            onChanged: (val) {
              themeService.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
