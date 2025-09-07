import 'package:hive/hive.dart';

part 'movie_details_hive_model.g.dart'; // This will be generated

@HiveType(typeId: 0)
class MovieDetailsHiveModel {
  @HiveField(0)
  bool? adult;

  @HiveField(1)
  String? backdropPath;

  @HiveField(2)
  int? budget;

  @HiveField(3)
  List<Genre>? genres;

  @HiveField(4)
  String? homepage;

  @HiveField(5)
  int? id;

  @HiveField(6)
  String? imdbId;

  @HiveField(7)
  List<String>? originCountry;

  @HiveField(8)
  String? originalLanguage;

  @HiveField(9)
  String? originalTitle;

  @HiveField(10)
  String? overview;

  @HiveField(11)
  double? popularity;

  @HiveField(12)
  String? posterPath;

  @HiveField(13)
  List<ProductionCompanies>? productionCompanies;

  @HiveField(14)
  String? releaseDate;

  @HiveField(15)
  int? revenue;

  @HiveField(16)
  int? runtime;

  @HiveField(17)
  List<SpokenLanguages>? spokenLanguages;

  @HiveField(18)
  String? status;

  @HiveField(19)
  String? tagline;

  @HiveField(20)
  String? title;

  @HiveField(21)
  bool? video;

  @HiveField(22)
  double? voteAverage;

  @HiveField(23)
  int? voteCount;

  MovieDetailsHiveModel({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
}

@HiveType(typeId: 1)
class Genre {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  Genre({this.id, this.name});
}

@HiveType(typeId: 2)
class ProductionCompanies {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? logoPath;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? originCountry;

  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });
}

@HiveType(typeId: 3)
class SpokenLanguages {
  @HiveField(0)
  String? englishName;

  @HiveField(1)
  String? iso6391;

  @HiveField(2)
  String? name;

  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });
}
