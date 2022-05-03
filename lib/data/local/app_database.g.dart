// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MovieTableData extends DataClass implements Insertable<MovieTableData> {
  final int id;
  final String name;
  final String genre;
  final String image;
  final int vote;
  final double rating;
  MovieTableData(
      {required this.id,
      required this.name,
      required this.genre,
      required this.image,
      required this.vote,
      required this.rating});
  factory MovieTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      genre: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      vote: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote'])!,
      rating: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['genre'] = Variable<String>(genre);
    map['image'] = Variable<String>(image);
    map['vote'] = Variable<int>(vote);
    map['rating'] = Variable<double>(rating);
    return map;
  }

  MovieTableCompanion toCompanion(bool nullToAbsent) {
    return MovieTableCompanion(
      id: Value(id),
      name: Value(name),
      genre: Value(genre),
      image: Value(image),
      vote: Value(vote),
      rating: Value(rating),
    );
  }

  factory MovieTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MovieTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      genre: serializer.fromJson<String>(json['genre']),
      image: serializer.fromJson<String>(json['image']),
      vote: serializer.fromJson<int>(json['vote']),
      rating: serializer.fromJson<double>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'genre': serializer.toJson<String>(genre),
      'image': serializer.toJson<String>(image),
      'vote': serializer.toJson<int>(vote),
      'rating': serializer.toJson<double>(rating),
    };
  }

  MovieTableData copyWith(
          {int? id,
          String? name,
          String? genre,
          String? image,
          int? vote,
          double? rating}) =>
      MovieTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        genre: genre ?? this.genre,
        image: image ?? this.image,
        vote: vote ?? this.vote,
        rating: rating ?? this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('MovieTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('genre: $genre, ')
          ..write('image: $image, ')
          ..write('vote: $vote, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, genre, image, vote, rating);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.genre == this.genre &&
          other.image == this.image &&
          other.vote == this.vote &&
          other.rating == this.rating);
}

class MovieTableCompanion extends UpdateCompanion<MovieTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> genre;
  final Value<String> image;
  final Value<int> vote;
  final Value<double> rating;
  const MovieTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.genre = const Value.absent(),
    this.image = const Value.absent(),
    this.vote = const Value.absent(),
    this.rating = const Value.absent(),
  });
  MovieTableCompanion.insert({
    required int id,
    required String name,
    required String genre,
    required String image,
    required int vote,
    required double rating,
  })  : id = Value(id),
        name = Value(name),
        genre = Value(genre),
        image = Value(image),
        vote = Value(vote),
        rating = Value(rating);
  static Insertable<MovieTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? genre,
    Expression<String>? image,
    Expression<int>? vote,
    Expression<double>? rating,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (genre != null) 'genre': genre,
      if (image != null) 'image': image,
      if (vote != null) 'vote': vote,
      if (rating != null) 'rating': rating,
    });
  }

  MovieTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? genre,
      Value<String>? image,
      Value<int>? vote,
      Value<double>? rating}) {
    return MovieTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      genre: genre ?? this.genre,
      image: image ?? this.image,
      vote: vote ?? this.vote,
      rating: rating ?? this.rating,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (vote.present) {
      map['vote'] = Variable<int>(vote.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('genre: $genre, ')
          ..write('image: $image, ')
          ..write('vote: $vote, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }
}

class $MovieTableTable extends MovieTable
    with TableInfo<$MovieTableTable, MovieTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String?> genre = GeneratedColumn<String?>(
      'genre', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<int?> vote = GeneratedColumn<int?>(
      'vote', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double?> rating = GeneratedColumn<double?>(
      'rating', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, genre, image, vote, rating];
  @override
  String get aliasedName => _alias ?? 'movie_table';
  @override
  String get actualTableName => 'movie_table';
  @override
  VerificationContext validateIntegrity(Insertable<MovieTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    } else if (isInserting) {
      context.missing(_genreMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('vote')) {
      context.handle(
          _voteMeta, vote.isAcceptableOrUnknown(data['vote']!, _voteMeta));
    } else if (isInserting) {
      context.missing(_voteMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MovieTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieTableData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MovieTableTable createAlias(String alias) {
    return $MovieTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MovieTableTable movieTable = $MovieTableTable(this);
  late final MovieDao movieDao = MovieDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movieTable];
}
