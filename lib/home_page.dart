import 'package:flutter/material.dart';

import 'person_list_section.dart';
import 'settings_section.dart';
import 'user_data_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserDataSection(),
                const Divider(),
                SettingsSection(),
                const Divider(),
                PersonListSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
