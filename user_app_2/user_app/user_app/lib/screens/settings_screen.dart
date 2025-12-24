import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/screens/services/locale_service.dart';
import 'package:user_app/l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localService = Provider.of<LocaleService>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            localService.changeLanguage('en');
          },
          child: Text(AppLocalizations.of(context)!.english),
        ),
        ElevatedButton(
          onPressed: () {
            localService.changeLanguage('ar');
          },
          child: Text(AppLocalizations.of(context)!.arabic),
        ),
        // Add more settings widgets here
      ],
    );
  }
}