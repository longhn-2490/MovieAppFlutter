// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditData _$CreditDataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CreditData',
      json,
      ($checkedConvert) {
        final val = CreditData(
          id: $checkedConvert('id', (v) => v as int?),
          casts: $checkedConvert(
              'cast',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => CastData.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'casts': 'cast'},
    );
