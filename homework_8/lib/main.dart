import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_8/actors/actors_page.dart';
import 'package:homework_8/client/client_mapping.dart';
import 'package:homework_8/client/movies_service.dart';
import 'package:homework_8/movies/movie_page.dart';
import 'package:homework_8/movies/movies_page.dart';
import 'package:homework_8/music/music_page.dart';
import 'package:homework_8/series/series_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final rootKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: rootKey,
  initialLocation: '/movies',
  routes: [
    ShellRoute(
      builder: (context, state, child) => ShellPage(child: child),
      routes: [
        GoRoute(
          path: '/movies',
          builder: (context, state) => const MoviesPage(),
          routes: [
            GoRoute(
              path: ':imbdId',
              parentNavigatorKey: rootKey,
              builder: (context, state) => MoviePage(imdbId: state.pathParameters["imbdId"]!),
            ),
          ],
        ),
        GoRoute(
          path: '/series',
          builder: (context, state) => const SeriesPage(),
        ),
        GoRoute(
          path: '/actors',
          builder: (context, state) => const ActorsPage(),
        ),
        GoRoute(
          path: '/music',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const MusicPage(), 
            transitionDuration: const Duration(seconds: 2),
            reverseTransitionDuration: const Duration(seconds: 2),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => 
                AnimatedBuilder(
                  animation: animation, 
                  builder: (context, child) {
                    return Transform.scale(
                      scale: CurvedAnimation(parent: animation, curve: Curves.bounceOut).value, 
                      child: child,
                    );
                  },
                  child: child,
                ),
          ),
          builder: (context, state) => const MusicPage(),
        ),
      ],
    ),
  ],
);

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
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}

class ShellPage extends StatefulWidget {
  final Widget child;

  const ShellPage({super.key, required this.child});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });

          switch (index) {
            case 0:
              context.go('/movies');
              break;
            case 1:
              context.go('/series');
              break;
            case 2:
              context.go('/actors');
              break;
            case 3:
              context.go('/music');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_rounded), 
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_rounded),
            label: 'Series',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man_rounded),
            label: 'Actors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_rounded),
            label: 'Music',
          ),
        ],
        useLegacyColorScheme: false,
      ),
      body: widget.child,
    );
  }
}
