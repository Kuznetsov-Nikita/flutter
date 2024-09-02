import 'package:flutter/material.dart';
import 'package:homework_7/clap_page.dart';
import 'package:homework_7/painter_page.dart';
import 'package:homework_7/progress_indicator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: switch(const String.fromEnvironment('MAIN_PAGE')) {
        'PAINTER' => const PainterPage(),
        'PROGRESS_INDICATOR' => const ProgressIndicatorPage(),
        'CLAP' => const ClapPage(),
        _ => null,
      },
    );
  }
}
