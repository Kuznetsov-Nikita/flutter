import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_10/blocs/movies_bloc.dart';
import 'package:homework_10/blocs/movies_event.dart';
import 'package:homework_10/blocs/movies_state.dart';
import 'package:homework_10/client/movies_service.dart';
import 'package:homework_10/movies/movies_list.dart';
import 'package:homework_10/utils/failure_widget.dart';
import 'package:homework_10/utils/load_status.dart';
import 'package:provider/provider.dart';

class MoviesEntryPage extends StatelessWidget {
  const MoviesEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoviesBloc(service: Provider.of<MoviesService>(context)),
      child: const MoviesPage(),
    );
  }
}

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MoviesBloc>();
    bloc.add(const MoviesEvent.fetch(shouldLoadMore: false));

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
            child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                switch (state.status) {
                  case LoadStatus.failure:
                    return SizedBox(
                      child: FailureWidget(
                        refresh: () => bloc.add(const FetchEvent(shouldLoadMore: false)),
                      ),
                    );
                  case LoadStatus.success:
                    return MoviesList(movies: state.movies);
                  default:
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
