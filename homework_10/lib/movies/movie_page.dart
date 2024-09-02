import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_10/blocs/movie_bloc.dart';
import 'package:homework_10/blocs/movie_event.dart';
import 'package:homework_10/blocs/movie_state.dart';
import 'package:homework_10/client/movies_service.dart';
import 'package:homework_10/favourites/favourite_movies.dart';
import 'package:homework_10/models/movie_info.dart';
import 'package:homework_10/utils/failure_widget.dart';
import 'package:homework_10/utils/load_status.dart';
import 'package:provider/provider.dart';

class MovieEntryPage extends StatelessWidget {
  final String imdbId;

  const MovieEntryPage({super.key, required this.imdbId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieBloc(service: Provider.of<MoviesService>(context), imdbId: imdbId),
      child: const MoviePage(),
    );
  }
}

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MovieBloc>();
    bloc.add(const MovieEvent.fetch());
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColorDark),
      backgroundColor: Theme.of(context).primaryColorLight,
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isLandscapeOrientation = orientation == Orientation.landscape;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), 
              child: BlocBuilder<MovieBloc, MovieState>( 
                builder: (context, state) {
                  switch (state.status) {
                    case LoadStatus.failure:
                      return SizedBox(
                        child: FailureWidget(
                          refresh: () => Provider.of<MovieBloc>(context).add(const FetchEvent()),
                        ),
                      );
                    case LoadStatus.success:
                      if (isLandscapeOrientation) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(state.movie?.imageUrl ?? '', fit: BoxFit.contain),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          state.movie?.title ?? '', 
                                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Consumer<FavouriteMovies>(
                                        builder: (context, repo, _) {
                                          final movieInfo = MovieInfo(
                                            imdbId: state.movie?.imdbId ?? '', 
                                            title: state.movie?.title ?? '', 
                                            popularity: state.movie?.popularity,
                                          );
                                          final hasMovie = repo.hasMovie(movieInfo);
                                          return IconButton(
                                            onPressed: () async => hasMovie
                                                ? repo.removeMovie(movieInfo) : await repo.addMovie(movieInfo),
                                            icon: Icon(
                                              repo.hasMovie(movieInfo) 
                                                  ? Icons.favorite_rounded 
                                                  : Icons.favorite_border_rounded,
                                            ),
                                            iconSize: 40,
                                            color: Colors.pink,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(state.movie?.description ?? '', style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.movie?.title ?? '', 
                                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Consumer<FavouriteMovies>(
                                  builder: (context, repo, _) {
                                    final movieInfo = MovieInfo(
                                      imdbId: state.movie?.imdbId ?? '', 
                                      title: state.movie?.title ?? '', 
                                      popularity: state.movie?.popularity,
                                    );
                                    final hasMovie = repo.hasMovie(movieInfo);
                                    return IconButton(
                                      onPressed: () async => hasMovie
                                          ? repo.removeMovie(movieInfo) : await repo.addMovie(movieInfo),
                                      icon: Icon(
                                        repo.hasMovie(movieInfo) 
                                            ? Icons.favorite_rounded 
                                            : Icons.favorite_border_rounded,
                                      ),
                                      iconSize: 40,
                                      color: Colors.pink,
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Image.network(state.movie?.imageUrl ?? ''),
                            const SizedBox(height: 16),
                            Text(state.movie?.description ?? '', style: const TextStyle(fontSize: 16)),
                          ],
                        );
                      }
                    default:
                      return const CircularProgressIndicator();  
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
