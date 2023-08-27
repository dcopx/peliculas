import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/movie.dart';
import '../provider_repository.dart';
import 'local_notifier.dart';

final existsFavorite = FutureProvider.family.autoDispose((ref, int movieID) {
  final localData = ref.watch(localDataProvider);
  return localData.isFavorite(movieID);
});

final favoriteMovies =
    StateNotifierProvider<LocalMoviesNotifier, Map<int, Movie>>((ref) {
  final localData = ref.watch(localDataProvider);
  return LocalMoviesNotifier(localData);
});
