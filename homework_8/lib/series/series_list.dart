import 'dart:math';

import 'package:flutter/material.dart';
import 'package:homework_8/models/movie_info.dart';
import 'package:loadmore/loadmore.dart';

class SeriesList extends StatefulWidget {
  final List<MovieInfo> seriesInfos;

  const SeriesList({super.key, required this.seriesInfos});

  @override
  State<SeriesList> createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {
  late int _count;

  @override
  void initState() {
    _count = min(10, widget.seriesInfos.length);
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _count = min(10, widget.seriesInfos.length);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LoadMore(
      onLoadMore: () async {
        if (_count < widget.seriesInfos.length) {
          setState(() {
            _count = min(_count + 10, widget.seriesInfos.length);
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
          final serieInfo = widget.seriesInfos[index];
          return SerieListTile(
            imdbId: serieInfo.imdbId, 
            title: serieInfo.title,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }
}

class SerieListTile extends StatelessWidget {
  final String imdbId;
  final String title;

  const SerieListTile({super.key, required this.imdbId, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        side: BorderSide(), 
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      tileColor: Theme.of(context).primaryColorLight,
      title: Text(title, style: const TextStyle(fontSize: 16)),
    );
  }
}
