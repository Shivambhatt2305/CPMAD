// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:multi_theme_switcher/main.dart';

void main() {
  testWidgets('App shows theme preview and settings', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(MyApp(prefs: prefs, initialTheme: AppTheme.light));

    expect(find.text('Preview'), findsOneWidget);
    expect(find.text('Multi Theme Switcher'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Theme Settings'), findsOneWidget);
    expect(find.byType(RadioListTile<AppTheme>), findsNWidgets(3));
  });
}
