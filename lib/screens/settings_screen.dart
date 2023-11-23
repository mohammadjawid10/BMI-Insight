import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'screens.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText('settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(LanguagesScreen.routeName);
            },
            title: const LocaleText('languages'),
            trailing: const Text(
              '🌐',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
