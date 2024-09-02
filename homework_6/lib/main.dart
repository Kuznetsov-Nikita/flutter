import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:homework_6/client/client_mapping.dart';
import 'package:homework_6/home_page.dart';
import 'package:homework_6/client/movies_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MoviesService.create(
        ChopperClient(
          converter: $JsonSerializableConverter(),
        ),
      ),
      dispose: (context, MoviesService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Homework 6',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
