import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:peliculas/domain/datasource/local_datasource.dart';
import 'package:peliculas/domain/entities/movie.dart';

class IsarLocalDataSource extends LocalDataSource {
  late Future<Isar> db;

  IsarLocalDataSource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema],
          inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isFavorite(int id) async {
    final isar = await db;
    final Movie? exists = await isar.movies.filter().idEqualTo(id).findFirst();
    return exists != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    final movies = isar.movies.where().offset(offset).limit(limit).findAll();
    return movies;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final Movie? exists =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();
    if (exists != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(exists.isarId!));
    } else {
      isar.writeTxnSync(() => isar.movies.putSync(movie));
    }
  }
}
