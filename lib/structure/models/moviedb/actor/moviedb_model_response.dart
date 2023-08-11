import 'moviedb_model_cast.dart';

class MovieCreditResponse {
  final int id;
  final List<MovieDbModelCast> cast;
  final List<MovieDbModelCast> crew;

  MovieCreditResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCreditResponse.fromJson(Map<String, dynamic> json) =>
      MovieCreditResponse(
        id: json["id"],
        cast: List<MovieDbModelCast>.from(
            json["cast"].map((x) => MovieDbModelCast.fromJson(x))),
        crew: List<MovieDbModelCast>.from(
            json["crew"].map((x) => MovieDbModelCast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}
