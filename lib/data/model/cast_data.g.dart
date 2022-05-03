// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastData _$CastDataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CastData',
      json,
      ($checkedConvert) {
        final val = CastData(
          id: $checkedConvert('id', (v) => v as int?),
          gender: $checkedConvert('gender', (v) => v as int?),
          video: $checkedConvert('video', (v) => v as bool?),
          name: $checkedConvert('name', (v) => v as String?),
          adult: $checkedConvert('adult', (v) => v as bool?),
          popularity:
              $checkedConvert('popularity', (v) => (v as num?)?.toDouble()),
          character: $checkedConvert('character', (v) => v as String?),
          order: $checkedConvert('order', (v) => v as int?),
          castId: $checkedConvert('cast_id', (v) => v as int?),
          creditId: $checkedConvert('credit_id', (v) => v as String?),
          knownForDepartment:
              $checkedConvert('known_for_department', (v) => v as String?),
          originalName: $checkedConvert('original_name', (v) => v as String?),
          profilePath: $checkedConvert('profile_path', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'castId': 'cast_id',
        'creditId': 'credit_id',
        'knownForDepartment': 'known_for_department',
        'originalName': 'original_name',
        'profilePath': 'profile_path'
      },
    );
