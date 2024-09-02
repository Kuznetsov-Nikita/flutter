import 'package:flutter/material.dart';
import 'package:homework_6/client/movies_service.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  final String imdbId;

  const MoviePage({super.key, required this.imdbId});

  @override
  Widget build(BuildContext context) {
    final moviesService = Provider.of<MoviesService>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColorDark),
      backgroundColor: Theme.of(context).primaryColorLight,
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isLandscapeOrientation = orientation == Orientation.landscape;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), 
              child: FutureBuilder(
                future: moviesService.getMovie(imdbId), 
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (data != null) {
                    var movie = data.body!.results;
                    if (isLandscapeOrientation) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.network(movie.imageUrl ?? '', fit: BoxFit.contain),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title, 
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                Text(movie.description ?? '', style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Text(
                            movie.title, 
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Image.network(movie.imageUrl ?? ''),
                          const SizedBox(height: 16),
                          Text(movie.description ?? '', style: const TextStyle(fontSize: 16)),
                        ],
                      );
                    }
                  } else {
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
