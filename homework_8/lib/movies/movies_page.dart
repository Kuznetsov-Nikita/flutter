import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework_8/client/movies_service.dart';
import 'package:homework_8/movies/movies_list.dart';
import 'package:homework_8/utils/debouncer.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
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
    return PopScope(
      onPopInvoked: (didPop) async {
        if (!kIsWeb) {
          final shouldExit = await showDialog<bool>(
            context: context, 
            builder: (context) => AlertDialog(
              title: const Text('Вы точно хотите выйти?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Да'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                TextButton(
                  child: const Text('Нет'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            ),
          );
          if (shouldExit == true) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
