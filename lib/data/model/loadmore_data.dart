import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/data/base/base_data.dart';
import 'package:movieapp/core/utils/constants.dart';

class LoadMoreData<T> {
  final List<T> data;
  final int? page;
  final int? totalPages;

  LoadMoreData({required this.data, required this.page, required this.totalPages});
}
