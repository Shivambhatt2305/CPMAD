# Multi Theme Switcher

Flutter demo app showing three predefined themes (Light, Dark, Custom Blue) with immediate switching and persistence.

## Features
- Three `ThemeData` configurations with custom primary, accent, and background colors via a `CustomColors` theme extension.
- Settings page with radio buttons to choose the active theme.
- Selection is stored with `shared_preferences` and restored on startup.
- Live preview of themed widgets: AppBar, buttons, cards, text, list tile, and a floating action button.

## Run the app
1. Install Flutter (3.8.0+). 
2. From the project root, fetch packages: `flutter pub get`.
3. Run on a device or emulator: `flutter run`.
4. To run tests: `flutter test`.

## Project structure
- `lib/main.dart`: Theme definitions, persistence logic, home preview, and settings page.
- `test/widget_test.dart`: Basic UI smoke test with theme selection.
