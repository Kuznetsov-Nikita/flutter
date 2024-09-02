import 'package:flutter/material.dart';
import 'package:homework_8/client/movies_service.dart';
import 'package:provider/provider.dart';

class ActorsPage extends StatelessWidget {
  const ActorsPage({super.key});

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
              future: moviesService.getActorsBirthdayToday(),
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (data != null) {
                  var actorInfos = data.body?.results ?? [];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Сегодня родились:',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      if (actorInfos.isEmpty)
                        const Text(
                          'Сегодня дней рождений известных актеров нет',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      if (actorInfos.isNotEmpty)
                        ListView.separated(
                          itemCount: actorInfos.length,
                          itemBuilder: (context, index) {
                            final actorInfo = actorInfos[index];
                            return Text(
                              actorInfo.name, 
                              style: const TextStyle(fontSize: 20, color: Colors.white),
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(height: 10),
                        ),
                    ],
                  );
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
