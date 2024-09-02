import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_11/client/client_mapping.dart';
import 'package:homework_11/client/movies_service.dart';
import 'package:homework_11/favourites/favourite_movies.dart';
import 'package:homework_11/favourites/favourite_movies_page.dart';
import 'package:homework_11/movies/movie_page.dart';
import 'package:homework_11/movies/movies_page.dart';
import 'package:homework_11/search/search_page.dart';
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
          builder: (context, state) => const MoviesEntryPage(),
          routes: [
            GoRoute(
              path: ':imbdId',
              parentNavigatorKey: rootKey,
              builder: (context, state) => MovieEntryPage(imdbId: state.pathParameters["imbdId"]!),
            ),
          ],
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchEntryPage(),
          routes: [
            GoRoute(
              path: ':imbdId',
              parentNavigatorKey: rootKey,
              builder: (context, state) => MovieEntryPage(imdbId: state.pathParameters["imbdId"]!),
            ),
          ],
        ),
        GoRoute(
          path: '/favourites',
          builder: (context, state) => const FavouriteMoviesPage(),
          routes: [
            GoRoute(
              path: ':imbdId',
              parentNavigatorKey: rootKey,
              builder: (context, state) => MovieEntryPage(imdbId: state.pathParameters["imbdId"]!),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => MoviesService.create(
            ChopperClient(
              converter: $JsonSerializableConverter(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => FavouriteMovies()),
      ],
      child: Builder(
        builder: (context) => FutureBuilder(
          future: context.read<FavouriteMovies>().initDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp.router(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                routerConfig: _router,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
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
              context.go('/search');
              break;
            case 2:
            context.go('/favourites');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_rounded), 
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favourites',
          ),
        ],
        useLegacyColorScheme: false,
      ),
      body: widget.child,
    );
  }
}
