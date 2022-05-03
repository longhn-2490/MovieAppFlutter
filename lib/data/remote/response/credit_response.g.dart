// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditResponse _$CreditResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreditResponse',
      json,
      ($checkedConvert) {
        final val = CreditResponse(
          creditData: $checkedConvert(
              'creditData',
              (v) => v == null
                  ? null
                  : CreditData.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
