import 'dart:math';

import 'package:flutter/material.dart';
import 'package:homework_6/models/movie_info.dart';
import 'package:homework_6/movie_page.dart';
import 'package:loadmore/loadmore.dart';

class MoviesList extends StatefulWidget {
  final List<MovieInfo> movieInfos;

  const MoviesList({super.key, required this.movieInfos});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late int _count;

  @override
  void initState() {
    _count = min(10, widget.movieInfos.length);
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _count = min(10, widget.movieInfos.length);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LoadMore(
      onLoadMore: () async {
        if (_count < widget.movieInfos.length) {
          setState(() {
            _count = min(_count + 10, widget.movieInfos.length);
          });
        }
        return true;
      },
      delegate: const DefaultLoadMoreDelegate(),
      textBuilder: (status) => '',
      child: ListView.separated(
        shrinkWrap: true, 
        itemCount: _count, 
        itemBuilder: (_, index) {
          final movieInfo = widget.movieInfos[index];
          return MovieListTile(
            imdbId: movieInfo.imdbId, 
            title: movieInfo.title,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }
}

class MovieListTile extends StatelessWidget {
  final String imdbId;
  final String title;

  const MovieListTile({super.key, required this.imdbId, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        side: BorderSide(), 
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      tileColor: Theme.of(context).primaryColorLight,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (context) => MoviePage(imdbId: imdbId),
          )),
    );
  }
}
