import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/data/base/base_data.dart';

part 'genre_data.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class GenreData with BaseData  implements Equatable {
  final int? id;
  final String? name;

  GenreData({this.id, this.name});

  factory GenreData.fromJson(Map<String, dynamic> json) =>
      _$GenreDataFromJson(json);

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;
}
