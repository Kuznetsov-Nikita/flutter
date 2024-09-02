import 'package:flutter/material.dart';
import 'package:homework_6/client/movies_service.dart';
import 'package:homework_6/utils/debouncer.dart';
import 'package:homework_6/movies_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchTextController = TextEditingController();
  final _onSearchDebouncer = Debouncer(delay: const Duration(seconds: 1));

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moviesService = Provider.of<MoviesService>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _searchTextController,
                onChanged: (value) => _onSearchDebouncer.debounce(() => setState(() {})),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFF1F1F1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Поиск'
                ),
              ),
              const SizedBox(height: 16),
              FutureBuilder(
                future: _searchTextController.text.isEmpty 
                    ? moviesService.getPopularMovies()
                    : moviesService.search(_searchTextController.text), 
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (data != null) {
                    var movieInfos = data.body?.results ?? [];
                    return MoviesList(movieInfos: movieInfos);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
