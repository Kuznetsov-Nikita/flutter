import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_10/favourites/favourite_movies.dart';
import 'package:provider/provider.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Consumer<FavouriteMovies>(
            builder: (context, repo, _) {
              final movies = repo.movies;
              return ListView.separated(
                shrinkWrap: true, 
                itemCount: movies.length, 
                itemBuilder: (_, index) {
                  final movieInfo = movies[index];
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
                    onTap: () => context.go('/favourites/${movieInfo.imdbId}'),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 10),
              );
            },
          ),
        ),
      ),
    );
  }
}
