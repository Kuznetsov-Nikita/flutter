import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homework_13/widgets/element_widget.dart';
import 'package:homework_13/widgets/locale_switch_widget.dart';
import 'package:homework_13/widgets/navigation/bottom_navigation_widget.dart';
import 'package:homework_13/widgets/navigation/left_navigation_widget.dart';
import 'package:homework_13/widgets/promo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const englishLocale = Locale('en');
  static const russianLocale = Locale('ru');

  Locale _currentLocale = russianLocale;
  bool get _isEnglishLocaleSelected => _currentLocale == englishLocale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 13',
      debugShowCheckedModeBanner: false,
      locale: _currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Material(
        child: Stack(
          children: [
            const HomePage(),
            LocaleSwitchWidget(
              value: _isEnglishLocaleSelected, 
              onChanged: (_) => setState(() {
                if (_isEnglishLocaleSelected) {
                  _currentLocale = russianLocale;
                } else {
                  _currentLocale = englishLocale;
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/background.jpg'),
        ),
      ),
      child: OrientationBuilder(
        builder: (context, orientation) {
          final isPortraitOrientation = orientation == Orientation.portrait;
          return Row(
            children: [
              if (!isPortraitOrientation) 
                const LeftNavigationWidget(),
              Expanded(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Promo(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                          child: isPortraitOrientation
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) {
                                    return const ElementWidget();
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 500, 
                                    mainAxisSpacing: 16, 
                                    crossAxisSpacing: 16, 
                                    childAspectRatio: 1.5,
                                  ),
                                  itemCount: 5,
                                  itemBuilder: (context, _) {
                                    return const ElementWidget();
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: isPortraitOrientation ? const BottomNavigationWidget() : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
