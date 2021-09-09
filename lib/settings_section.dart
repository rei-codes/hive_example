import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsSection extends StatelessWidget {
  final settingsBox = Hive.box('settings');

  bool get isDarkTheme => settingsBox.get('isDarkTheme') ?? false;
  String get language => settingsBox.get('language', defaultValue: 'en');

  saveSettings() {
    settingsBox.put('isDarkTheme', true);
    settingsBox.put('language', 'en');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Settings', style: TextStyle(fontSize: 20)),
        Row(children: [Text('isDarkTheme: '), Text('$isDarkTheme')]),
        const SizedBox(height: 4),
        Row(children: [Text('language: '), Text(language)]),
        OutlinedButton(child: Text('Save'), onPressed: saveSettings),
      ],
    );
  }
}
