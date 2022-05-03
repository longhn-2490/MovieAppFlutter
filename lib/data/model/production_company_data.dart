import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/data/base/base_data.dart';

part 'production_company_data.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ProductionCompanyData with BaseData  implements Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'origin_country')
  final String? originCountry;

  factory ProductionCompanyData.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyDataFromJson(json);

  ProductionCompanyData(
      {this.id, this.name, this.logoPath, this.originCountry});

  @override
  List<Object?> get props => [id, name, logoPath, originCountry];

  @override
  bool? get stringify => true;
}
