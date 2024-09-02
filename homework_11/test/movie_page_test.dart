import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:homework_11/blocs/movie_bloc.dart';
import 'package:homework_11/blocs/movie_event.dart';
import 'package:homework_11/blocs/movie_state.dart';
import 'package:homework_11/favourites/favourite_movies.dart';
import 'package:homework_11/models/movie.dart';
import 'package:homework_11/models/movie_info.dart';
import 'package:homework_11/movies/movie_page.dart';
import 'package:homework_11/utils/failure_widget.dart';
import 'package:homework_11/utils/load_status.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockMovieBloc extends MockBloc<MovieEvent, MovieState> implements MovieBloc {}
class MockFavouriteMovies extends Mock implements FavouriteMovies {}

void main() {
  group('MoviePage', () {
    group('MoviePage widget test', () {
      late MockMovieBloc mockMovieBloc;

      setUp(() {
        mockMovieBloc = MockMovieBloc();
      });

      testWidgets('Initial state', (tester) async {
        when(() => mockMovieBloc.state).thenReturn(const MovieState(status: LoadStatus.loading));

        await tester.pumpWidget(
          MaterialApp(
            home: Provider<MovieBloc>(
              create: (_) => mockMovieBloc,
              child: const MoviePage(),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('Failure state', (tester) async {
        when(() => mockMovieBloc.state).thenReturn(const MovieState(status: LoadStatus.failure));

        await tester.pumpWidget(
          MaterialApp(
            home: Provider<MovieBloc>(
              create: (_) => mockMovieBloc,
              child: const MoviePage(),
            ),
          ),
        );

        expect(find.byType(FailureWidget), findsOneWidget);
      });

      setUpAll(() {
        registerFallbackValue(const MovieInfo(imdbId: 'tt123456', title: 'Movie 1'));
      });

      testWidgets('Success state', (tester) async {
        when(() => mockMovieBloc.state).thenReturn(
          const MovieState(
            status: LoadStatus.success,
            movie: Movie(
              imdbId: 'tt123456', 
              title: 'Movie 1', 
              imageUrl: 'assets/images/image.jpg', 
              description: 'Description',
            ),
          ),
        );

        final mockFavouriteMovies = MockFavouriteMovies();
        when(() => mockFavouriteMovies.hasMovie(any())).thenReturn(false);

        await tester.pumpWidget(
          MaterialApp(
            home: MultiProvider(
              providers: [
                Provider<MovieBloc>(
                  create: (_) => mockMovieBloc,
                ),
                ChangeNotifierProvider<FavouriteMovies>(
                  create: (_) => mockFavouriteMovies,
                ),
              ],
              child: const MoviePage(),
            ),
          ),
        );

        expect(find.text('Movie 1'), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);
      });
    });

    group('MoviePage golden test', () {
      late MockMovieBloc mockMovieBloc;

      setUp(() {
        mockMovieBloc = MockMovieBloc();
      });

      setUpAll(() {
        registerFallbackValue(const MovieInfo(imdbId: 'tt123456', title: 'Movie 1'));
      });

      testGoldens('Horizontal orientation', (tester) async {
        await loadAppFonts();

        when(() => mockMovieBloc.state).thenReturn(
          const MovieState(
            status: LoadStatus.success,
            movie: Movie(
              imdbId: 'tt123456', 
              title: 'Movie 1', 
              imageUrl: 'assets/images/image.jpg', 
              description: 'Description',
            ),
          ),
        );

        final mockFavouriteMovies = MockFavouriteMovies();
        when(() => mockFavouriteMovies.hasMovie(any())).thenReturn(false);

        await tester.pumpWidgetBuilder(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MultiProvider(
              providers: [
                Provider<MovieBloc>(
                  create: (_) => mockMovieBloc,
                ),
                ChangeNotifierProvider<FavouriteMovies>(
                  create: (_) => mockFavouriteMovies,
                ),
              ],
              child: const MoviePage(),
            ),
          ),
          surfaceSize: const Size(900, 600),
        );

        await screenMatchesGolden(tester, 'movie_page_horizontal');
      });

      testGoldens('Vertical orientation', (tester) async {
        await loadAppFonts();

        when(() => mockMovieBloc.state).thenReturn(
          const MovieState(
            status: LoadStatus.success,
            movie: Movie(
              imdbId: 'tt123456', 
              title: 'Movie 1', 
              imageUrl: 'assets/images/image.jpg', 
              description: 'Description',
            ),
          ),
        );

        final mockFavouriteMovies = MockFavouriteMovies();
        when(() => mockFavouriteMovies.hasMovie(any())).thenReturn(false);

        await tester.pumpWidgetBuilder(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MultiProvider(
              providers: [
                Provider<MovieBloc>(
                  create: (_) => mockMovieBloc,
                ),
                ChangeNotifierProvider<FavouriteMovies>(
                  create: (_) => mockFavouriteMovies,
                ),
              ],
              child: const MoviePage(),
            ),
          ),
          surfaceSize: const Size(600, 900),
        );

        await screenMatchesGolden(tester, 'movie_page_vertical');
      });
    });
  });
}
