import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:homework_11/favourites/favourite_movies.dart';
import 'package:homework_11/favourites/favourite_movies_page.dart';
import 'package:homework_11/models/movie_info.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockFavouriteMovies extends Mock implements FavouriteMovies {}

void main() {
  group('FavouriteMoviesPage', () {
    setUpAll(() {
      registerFallbackValue(const MovieInfo(imdbId: 'tt123456', title: 'Movie 1'));
    });

    testWidgets('FavouriteMoviesPage widget test', (tester) async {
      final mockFavouriteMovies = MockFavouriteMovies();

      when(() => mockFavouriteMovies.movies).thenReturn([
        const MovieInfo(title: 'Movie 1', imdbId: 'tt123456'),
        const MovieInfo(title: 'Movie 2', imdbId: 'tt654321'),
      ]);

      when(() => mockFavouriteMovies.hasMovie(any())).thenReturn(true);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ChangeNotifierProvider<FavouriteMovies>(
            create: (_) => mockFavouriteMovies,
            child: const FavouriteMoviesPage(),
          ),
        ),
      );

      expect(find.text('Movie 1'), findsOneWidget);
      expect(find.text('Movie 2'), findsOneWidget);
    });

    testGoldens('FavouriteMoviesPage golden test', (tester) async {
      final mockFavouriteMovies = MockFavouriteMovies();

      await loadAppFonts();

      when(() => mockFavouriteMovies.movies).thenReturn([
        const MovieInfo(title: 'Movie 1', imdbId: 'tt123456'),
        const MovieInfo(title: 'Movie 2', imdbId: 'tt654321'),
      ]);

      when(() => mockFavouriteMovies.hasMovie(any())).thenReturn(true);

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ChangeNotifierProvider<FavouriteMovies>(
            create: (_) => mockFavouriteMovies,
            child: const FavouriteMoviesPage(),
          ),
        ),
      );

      await screenMatchesGolden(tester, 'favourite_movies_page');
    });
  });
}
