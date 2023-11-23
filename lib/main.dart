import 'package:bmi_calculator_app/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'fa', 'ps']);
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => ChangeNotifierProvider.value(
        value: BmiProvider(),
        child: MaterialApp(
          supportedLocales: Locales.supportedLocales,
          localizationsDelegates: Locales.delegates,
          locale: locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Lato',
            primaryColor: Colors.green,
          ),
          home: const BottomNavigationBarScreen(),
          routes: {
            SettingsScreen.routeName: (context) => const SettingsScreen(),
            LanguagesScreen.routeName: (context) => const LanguagesScreen(),
          },
        ),
      ),
    );
  }
}

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final List<Widget> screens = const [
    HomeScreen(),
    SettingsScreen(),
  ];

  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: IndexedStack(
      //   index: pageIndex,
      //   children: [...screens],
      // ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: context.localeString('home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: context.localeString('settings'),
          ),
        ],
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
          pageController.jumpToPage(value);
        },
      ),
    );
  }
}
