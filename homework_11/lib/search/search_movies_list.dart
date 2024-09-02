import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_11/blocs/search_movies_bloc.dart';
import 'package:homework_11/blocs/search_movies_event.dart';
import 'package:homework_11/favourites/favourite_movies.dart';
import 'package:homework_11/models/movie_info.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';

class SearchMoviesList extends StatelessWidget {
  final List<MovieInfo> movies;

  const SearchMoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchMoviesBloc>();
    return LoadMore(
      onLoadMore: () async {
        bloc.add(const SearchMoviesEvent.loadMore());
        return true;
      },
      isFinish: !bloc.state.canLoadMore,
      delegate: const DefaultLoadMoreDelegate(),
      textBuilder: (status) => '',
      child: ListView.separated(
        shrinkWrap: true, 
        itemCount: movies.length, 
        itemBuilder: (_, index) {
          final movieInfo = movies[index];
          return SearchMovieListTile(
            movieInfo: movieInfo,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }
}

class SearchMovieListTile extends StatelessWidget {
  final MovieInfo movieInfo;

  const SearchMovieListTile({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        side: BorderSide(), 
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      tileColor: Theme.of(context).primaryColorLight,
      leading: Consumer<FavouriteMovies>(
        builder: (context, repo, _) {
          final hasMovie = repo.hasMovie(movieInfo);
          return IconButton(
            onPressed: () async => hasMovie 
                ? await repo.removeMovie(movieInfo) : await repo.addMovie(movieInfo),
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
      title: Text(movieInfo.title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.go('/search/${movieInfo.imdbId}'),
    );
  }
}
