import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/actor.dart';

typedef ActorCallBack = Future<List<Actor>> Function(String id);

class ActorNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final ActorCallBack fetchActors;

  ActorNotifier({required this.fetchActors}) : super({});

  Future<void> loadActors(String id) async {
    if (state[id] != null) return;

    final actors = await fetchActors(id);
    state = {...state, id: actors};
  }
}
