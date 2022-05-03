// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movieapp/domain/usecases/get_casts_usecase.dart';
//
// import 'cast_event.dart';
// import 'cast_state.dart';
//
// class CastBloc extends Bloc<CastEvent, CastState> {
//   final GetCastsUseCase getCastsUseCase;
//
//   CastBloc( this.getCastsUseCase) : super(CastsLoading()) {
//     on<LoadCastsEvent>(_onStarted);
//   }
//
//   void _onStarted(LoadCastsEvent event, Emitter<CastState> emit) async {
//     try {
//       final casts = await getCastsUseCase.call(CastParams(id: event.id));
//        emit(CastsLoaded(casts: casts));
//     } catch (_) {
//       emit(CastLoadFailed(message: 'fail'));
//     }
//   }
// }
