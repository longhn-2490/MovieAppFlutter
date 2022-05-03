import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/data/model/credit_data.dart';

import '../../model/movie_data.dart';

part 'credit_response.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CreditResponse {
  final CreditData? creditData;

  CreditResponse({this.creditData});

  factory CreditResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditResponseFromJson(json);
}
