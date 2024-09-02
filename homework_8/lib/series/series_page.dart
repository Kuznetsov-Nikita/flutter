import 'package:flutter/material.dart';
import 'package:homework_8/client/movies_service.dart';
import 'package:homework_8/series/series_list.dart';
import 'package:provider/provider.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesService = Provider.of<MoviesService>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: FutureBuilder(
              future: moviesService.getPopularSeries(),
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (data != null) {
                  var seriesInfos = data.body?.results ?? [];
                  return SeriesList(seriesInfos: seriesInfos);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
