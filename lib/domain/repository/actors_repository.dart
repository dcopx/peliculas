import '../entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorByMovieId(String id);
}
