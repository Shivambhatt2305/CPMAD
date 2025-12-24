import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/app_localizations.dart';

class LocaleService with ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  LocaleService() {
    _loadLocale();
  }
  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    _locale = Locale(prefs.getString('langCode') ?? 'en');
    notifyListeners();
  }

  void changeLanguage(String langCode) async {
    _locale = Locale(langCode);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('langCode', langCode);
  }

  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  // Robust resolution that accepts either a single Locale or a list (including
  // JSArray on web). It extracts the first device locale's languageCode safely
  // and matches it against supported locales.
  static Locale? _resolveLocales(dynamic locales, Iterable<Locale> supportedLocales) {
    String? deviceLanguageCode;

    try {
      if (locales == null) {
        deviceLanguageCode = null;
      } else if (locales is Locale) {
        deviceLanguageCode = locales.languageCode;
      } else if (locales is Iterable && locales.isNotEmpty) {
        final first = locales.first;
        if (first is Locale) {
          deviceLanguageCode = first.languageCode;
        }
      } else {
        // Fallback for JS interop structures (e.g. JSArray)
        try {
          final first = (locales as dynamic)[0];
          if (first is Locale) deviceLanguageCode = first.languageCode;
        } catch (_) {
          deviceLanguageCode = null;
        }
      }
    } catch (_) {
      deviceLanguageCode = null;
    }

    if (deviceLanguageCode != null) {
      for (var locale in supportedLocales) {
        if (locale.languageCode == deviceLanguageCode) return locale;
      }
    }

    return supportedLocales.first;
  }

  // Provide both names in case the caller uses either `localResolutionCallback`
  // or `localeResolutionCallback` (defensive compatibility).
  static Locale? localResolutionCallback(dynamic locales, Iterable<Locale> supportedLocales) =>
      _resolveLocales(locales, supportedLocales);

  static Locale? localeResolutionCallback(dynamic locales, Iterable<Locale> supportedLocales) =>
      _resolveLocales(locales, supportedLocales);
}
