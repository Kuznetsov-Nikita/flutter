import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_10/blocs/search_movies_bloc.dart';
import 'package:homework_10/blocs/search_movies_event.dart';
import 'package:homework_10/blocs/search_movies_state.dart';
import 'package:homework_10/client/movies_service.dart';
import 'package:homework_10/search/search_movies_list.dart';
import 'package:homework_10/utils/debouncer.dart';
import 'package:homework_10/utils/failure_widget.dart';
import 'package:homework_10/utils/load_status.dart';
import 'package:provider/provider.dart';

class SearchEntryPage extends StatelessWidget {
  const SearchEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchMoviesBloc(service: Provider.of<MoviesService>(context)), 
      child: const SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchMoviesBloc>();
    final controller = TextEditingController();
    final onSearchDebouncer = Debouncer(delay: const Duration(seconds: 1));
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              TextField(
                controller: controller,
                onChanged: (value) => onSearchDebouncer.debounce(
                  () => bloc.add(SearchMoviesEvent.search(searchText: value)),
                ),
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
              BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                builder: (context, state) {
                  switch (state.status) {
                    case LoadStatus.failure:
                      return SizedBox(
                        child: FailureWidget(
                          refresh: () => bloc.add(SearchMoviesEvent.search(searchText: controller.text)),
                        ),
                      );
                    case LoadStatus.success:
                      return SearchMoviesList(movies: state.movies);
                    default:
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
