// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanyData _$ProductionCompanyDataFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ProductionCompanyData',
      json,
      ($checkedConvert) {
        final val = ProductionCompanyData(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          logoPath: $checkedConvert('logo_path', (v) => v as String?),
          originCountry: $checkedConvert('origin_country', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'logoPath': 'logo_path',
        'originCountry': 'origin_country'
      },
    );