import '../entities/actor.dart';

abstract class ActorsDataSource {
  Future<List<Actor>> getActorByMovieId(String id);
}
