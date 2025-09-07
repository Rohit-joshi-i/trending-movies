// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsHiveModelAdapter extends TypeAdapter<MovieDetailsHiveModel> {
  @override
  final int typeId = 0;

  @override
  MovieDetailsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsHiveModel(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      budget: fields[2] as int?,
      genres: (fields[3] as List?)?.cast<Genre>(),
      homepage: fields[4] as String?,
      id: fields[5] as int?,
      imdbId: fields[6] as String?,
      originCountry: (fields[7] as List?)?.cast<String>(),
      originalLanguage: fields[8] as String?,
      originalTitle: fields[9] as String?,
      overview: fields[10] as String?,
      popularity: fields[11] as double?,
      posterPath: fields[12] as String?,
      productionCompanies: (fields[13] as List?)?.cast<ProductionCompanies>(),
      releaseDate: fields[14] as String?,
      revenue: fields[15] as int?,
      runtime: fields[16] as int?,
      spokenLanguages: (fields[17] as List?)?.cast<SpokenLanguages>(),
      status: fields[18] as String?,
      tagline: fields[19] as String?,
      title: fields[20] as String?,
      video: fields[21] as bool?,
      voteAverage: fields[22] as double?,
      voteCount: fields[23] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsHiveModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.budget)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.homepage)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.imdbId)
      ..writeByte(7)
      ..write(obj.originCountry)
      ..writeByte(8)
      ..write(obj.originalLanguage)
      ..writeByte(9)
      ..write(obj.originalTitle)
      ..writeByte(10)
      ..write(obj.overview)
      ..writeByte(11)
      ..write(obj.popularity)
      ..writeByte(12)
      ..write(obj.posterPath)
      ..writeByte(13)
      ..write(obj.productionCompanies)
      ..writeByte(14)
      ..write(obj.releaseDate)
      ..writeByte(15)
      ..write(obj.revenue)
      ..writeByte(16)
      ..write(obj.runtime)
      ..writeByte(17)
      ..write(obj.spokenLanguages)
      ..writeByte(18)
      ..write(obj.status)
      ..writeByte(19)
      ..write(obj.tagline)
      ..writeByte(20)
      ..write(obj.title)
      ..writeByte(21)
      ..write(obj.video)
      ..writeByte(22)
      ..write(obj.voteAverage)
      ..writeByte(23)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final int typeId = 1;

  @override
  Genre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genre(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCompaniesAdapter extends TypeAdapter<ProductionCompanies> {
  @override
  final int typeId = 2;

  @override
  ProductionCompanies read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompanies(
      id: fields[0] as int?,
      logoPath: fields[1] as String?,
      name: fields[2] as String?,
      originCountry: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompanies obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.logoPath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompaniesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpokenLanguagesAdapter extends TypeAdapter<SpokenLanguages> {
  @override
  final int typeId = 3;

  @override
  SpokenLanguages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguages(
      englishName: fields[0] as String?,
      iso6391: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguages obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishName)
      ..writeByte(1)
      ..write(obj.iso6391)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
