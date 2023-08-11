import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/provider/actor/actor_providers.dart';

class ActorsListView extends ConsumerStatefulWidget {
  final int id;
  ActorsListView({required this.id});

  @override
  ConsumerState<ActorsListView> createState() => _ActorsListViewState();
}

class _ActorsListViewState extends ConsumerState<ActorsListView> {
  @override
  void initState() {
    super.initState();
    ref.read(actorProvider.notifier).loadActors(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final actors = ref.watch(actorProvider)[widget.id.toString()];

    if (actors == null) return const CircularProgressIndicator();

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final textTheme = Theme.of(context).textTheme;
          final actor = actors[index];
          return Container(
            height: 200,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: (actor.photoPath != 'no-poster')
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w300${actor.photoPath}',
                            fit: BoxFit.cover)
                        : Image.asset('assets/images/no-poster.jpg',
                            fit: BoxFit.cover)),
                Text(actor.name,
                    style: textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                Text(actor.character ?? '',
                    style: textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        },
      ),
    );
  }
}
