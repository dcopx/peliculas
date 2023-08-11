import 'package:peliculas/domain/entities/actor.dart';
import 'package:peliculas/structure/models/moviedb/actor/moviedb_model_cast.dart';

class ActorMapper {
  static Actor actorMovieDbToEntity(MovieDbModelCast model) => Actor(
        id: model.id,
        name: model.name,
        photoPath: model.profilePath ?? '',
        character: model.character,
      );
}
