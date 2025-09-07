import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trending_movies/services/hivedb/movie_details_hive_model.dart';

import 'movie_list_hive_model.dart';

class HiveManager {
  HiveManager._internal();

  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() {
    return _instance;
  }

  Box? _box;
  Box<MovieListHiveModel>? _trendingMovieBox;
  Box<MovieListHiveModel>? _nowPlayingBox;

  void registerAdapter() {
    Hive.registerAdapter(MovieDetailsHiveModelAdapter());
    Hive.registerAdapter(GenreAdapter());
    Hive.registerAdapter(ProductionCompaniesAdapter());
    Hive.registerAdapter(SpokenLanguagesAdapter());
    Hive.registerAdapter(MovieListHiveModelAdapter());
  }

  Future<void> initHive({String boxName = "User Box"}) async {
    if (!Hive.isBoxOpen(boxName)) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      _box = await Hive.openBox(boxName);
    } else {
      _box = Hive.box(boxName);
    }
  }

  Future<void> initTrendingMovies({String boxName = "trendingMovie"}) async {
    if (!Hive.isBoxOpen(boxName)) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      _trendingMovieBox = await Hive.openBox(boxName);
    } else {
      _trendingMovieBox = Hive.box(boxName);
    }
  }

  Future<void> initNowPlayingMovies({String boxName = "nowPlaying"}) async {
    if (!Hive.isBoxOpen(boxName)) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      _nowPlayingBox = await Hive.openBox(boxName);
    } else {
      _nowPlayingBox = Hive.box(boxName);
    }
  }

  Box<MovieListHiveModel> get trendingMovieBox {
    if (_trendingMovieBox == null) {
      throw Exception("Hive box not initialized. Call initHive() first.");
    }
    return _trendingMovieBox!;
  }

  Box<MovieListHiveModel> get nowPlayingBox {
    if (_nowPlayingBox == null) {
      throw Exception("Hive box not initialized. Call initHive() first.");
    }
    return _nowPlayingBox!;
  }

  /// Get the box
  Box get box {
    if (_box == null) {
      throw Exception("Hive box not initialized. Call initHive() first.");
    }
    return _box!;
  }

  Future<void> putNowPlayingMovies(String key, dynamic value) async {
    await nowPlayingBox.put(key, value);
  }

  Future<void> putTrendingMovies(String key, dynamic value) async {
    await trendingMovieBox.put(key, value);
  }

  /// Put a value
  Future<void> put(String key, dynamic value) async {
    await box.put(key, value);
  }

  /// Get a value
  dynamic get(String key, {dynamic defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  /// Delete a value
  Future<void> delete(String key) async {
    await box.delete(key);
  }

  /// Clear all values
  Future<void> clear() async {
    await box.clear();
  }

  List<MovieDetailsHiveModel> getAllMovie() {
    var value = box.values.toList().cast<MovieDetailsHiveModel>();
    return value;
  }

  List<MovieListHiveModel> getNowPlayingMovies() {
    return nowPlayingBox.values.toList().cast<MovieListHiveModel>();
  }

  List<MovieListHiveModel> getTrendingMovies() {
    return trendingMovieBox.values.toList().cast<MovieListHiveModel>();
  }
}
