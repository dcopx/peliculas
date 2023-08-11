import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/structure/datasource/actors_datasource.dart';
import 'package:peliculas/structure/datasource/moviedb_datasource.dart';
import 'package:peliculas/structure/repository/actors_repository_impl.dart';
import 'package:peliculas/structure/repository/movies_repository_impl.dart';

final moviesRepositoryProvider =
    Provider((ref) => MoviesRepositoryImpl(MovieDbDataSource()));

final actorsRepositoryProvider =
    Provider((ref) => ActorsRepositoryImpl(ActorsDbDataSource()));
