import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/data/base/base_data.dart';
import 'package:movieapp/core/utils/constants.dart';

part 'cast_data.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CastData with BaseData implements Equatable {
  final int? id;
  final int? gender;
  final bool? video;
  final String? name;
  final bool? adult;
  final double? popularity;
  final String? character;
  final int? order;
  @JsonKey(name: 'cast_id')
  final int? castId;
  @JsonKey(name: 'credit_id')
  final String? creditId;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  @JsonKey(name: 'original_name')
  final String? originalName;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  CastData({
      this.id,
      this.gender,
      this.video,
      this.name,
      this.adult,
      this.popularity,
      this.character,
      this.order,
      this.castId,
      this.creditId,
      this.knownForDepartment,
      this.originalName,
      this.profilePath});

  factory CastData.fromJson(Map<String, dynamic> json) => _$CastDataFromJson(json);

  String getImagePath() {
    return preImageUrl + '$profilePath';
  }

  @override
  List<Object?> get props => [
        id,
        gender,
        video,
        name,
        adult,
        popularity,
        character,
        order,
        castId,
        creditId,
        knownForDepartment,
        originalName,
        profilePath
      ];

  @override
  bool? get stringify => true;
}
