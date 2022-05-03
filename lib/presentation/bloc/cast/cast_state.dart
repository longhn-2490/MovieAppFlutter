import 'package:equatable/equatable.dart';

import '../../../data/model/cast_data.dart';

abstract class CastState implements Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class Idle extends CastState {
  @override
  bool? get stringify => true;
}

class CastsLoading extends CastState {
  @override
  bool? get stringify => true;
}

class CastsLoaded extends CastState {
  final List<CastData> casts;

  CastsLoaded({required this.casts});

  @override
  List<Object> get props => [casts];

  @override
  bool? get stringify => true;
}

class CastLoadFailed extends CastState {
  final String message;

  CastLoadFailed({required this.message});

  @override
  bool? get stringify => true;
}
