import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/structure/models/moviedb/moviedb_model_movie.dart';
import 'package:peliculas/structure/models/moviedb/moviedb_model_movie_detail.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieDbModelMovie model) => Movie(
      adult: model.adult,
      backdropPath: (model.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${model.backdropPath}'
          : 'https://www.fml.com.mx/wp-content/uploads/2016/04/Race-Registration-Image-Not-Found.png',
      genreIds: model.genreIds.map((e) => e.toString()).toList(),
      id: model.id,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: (model.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${model.posterPath}'
          : 'no-poster',
      releaseDate: model.releaseDate,
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount);

  static Movie movieDbDetailToEntity(MovieDetail model) => Movie(
      adult: model.adult,
      backdropPath: (model.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${model.backdropPath}'
          : 'https://www.fml.com.mx/wp-content/uploads/2016/04/Race-Registration-Image-Not-Found.png',
      genreIds: model.genres.map((e) => e.name).toList(),
      id: model.id,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: (model.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${model.posterPath}'
          : 'https://www.fml.com.mx/wp-content/uploads/2016/04/Race-Registration-Image-Not-Found.png',
      releaseDate: model.releaseDate,
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount);
}
