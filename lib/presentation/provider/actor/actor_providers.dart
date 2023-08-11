import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/provider/actor/actor_notifier.dart';
import 'package:peliculas/presentation/provider/provider_repository.dart';

import '../../../domain/entities/actor.dart';

final actorProvider =
    StateNotifierProvider<ActorNotifier, Map<String, List<Actor>>>((ref) {
  final fetchActors = ref.watch(actorsRepositoryProvider).getActorByMovieId;
  return ActorNotifier(fetchActors: fetchActors);
});
