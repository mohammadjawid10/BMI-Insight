import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  static const routeName = '/languages';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText('languages'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              context.changeLocale('en');
            },
            title: const Text('English'),
            trailing: const Text('🇺🇸'),
          ),
          ListTile(
            onTap: () {
              context.changeLocale('fa');
            },
            title: const Text('دری'),
            trailing: const Text('🇦🇫'),
          ),
          ListTile(
            onTap: () {
              context.changeLocale('ps');
            },
            title: const Text('پښتو'),
            trailing: const Text('🇦🇫'),
          ),
        ],
      ),
    );
  }
}
