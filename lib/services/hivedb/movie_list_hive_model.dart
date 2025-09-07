import 'package:hive/hive.dart';

part 'movie_list_hive_model.g.dart'; // This will be generated

@HiveType(typeId: 4) // 🔹 Make sure this typeId is unique
class MovieListHiveModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? overview;

  @HiveField(3)
  String? posterPath;

  @HiveField(4)
  String? backdropPath;

  @HiveField(5)
  String? releaseDate;

  @HiveField(6)
  double? voteAverage;

  @HiveField(7)
  int? voteCount;

  @HiveField(8)
  bool? adult;

  @HiveField(9)
  bool? video;

  @HiveField(10)
  double? popularity;

  @HiveField(11)
  List<int>? genreIds;

  @HiveField(12)
  String? originalLanguage;

  @HiveField(13)
  String? originalTitle;

  MovieListHiveModel({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.video,
    this.popularity,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
  });
}
