class MovieModel {
  int? id;
  String? title;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;
  bool? adult;
  bool? video;
  double? popularity;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;

  MovieModel({
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
