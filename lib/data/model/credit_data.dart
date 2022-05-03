import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/data/base/base_data.dart';
import 'package:movieapp/data/model/cast_data.dart';
part 'credit_data.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CreditData {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'cast')
  final List<CastData>? casts;

  CreditData({
    this.id,
    this.casts,
  });

  factory CreditData.fromJson(Map<String, dynamic> json) =>
      _$CreditDataFromJson(json);
}
