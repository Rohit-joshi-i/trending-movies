// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieListHiveModelAdapter extends TypeAdapter<MovieListHiveModel> {
  @override
  final int typeId = 4;

  @override
  MovieListHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieListHiveModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      overview: fields[2] as String?,
      posterPath: fields[3] as String?,
      backdropPath: fields[4] as String?,
      releaseDate: fields[5] as String?,
      voteAverage: fields[6] as double?,
      voteCount: fields[7] as int?,
      adult: fields[8] as bool?,
      video: fields[9] as bool?,
      popularity: fields[10] as double?,
      genreIds: (fields[11] as List?)?.cast<int>(),
      originalLanguage: fields[12] as String?,
      originalTitle: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieListHiveModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.backdropPath)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.voteAverage)
      ..writeByte(7)
      ..write(obj.voteCount)
      ..writeByte(8)
      ..write(obj.adult)
      ..writeByte(9)
      ..write(obj.video)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.genreIds)
      ..writeByte(12)
      ..write(obj.originalLanguage)
      ..writeByte(13)
      ..write(obj.originalTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
