import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/core/utils/constants.dart';
import 'package:movieapp/data/local/app_database.dart';
import 'package:movieapp/data/local/moor/dao/movie_dao.dart';
import 'package:movieapp/data/local/moor/database_api.dart';
import 'package:movieapp/data/local/moor/database_impl.dart';
import 'package:movieapp/data/movie_repository_impl.dart';
import 'package:movieapp/data/remote/api/dio/movie_api.dart';
import 'package:movieapp/data/remote/builder/dio_builder.dart';

import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/delete_movie_usecase.dart';
import 'package:movieapp/domain/usecases/find_movies_usecase.dart';
import 'package:movieapp/domain/usecases/get_casts_usecase.dart';
import 'package:movieapp/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movieapp/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:movieapp/domain/usecases/get_movies_usecase.dart';
import 'package:movieapp/domain/usecases/get_similar_movies_usecase.dart';
import 'package:movieapp/domain/usecases/insert_movie_usecase.dart';
import 'package:movieapp/presentation/bloc/cast/bloc.dart';
import 'package:movieapp/presentation/bloc/favoritemovie/bloc.dart';
import 'package:movieapp/presentation/bloc/moviebygenre/movie_by_genre_bloc.dart';
import 'package:movieapp/presentation/bloc/moviedetail/bloc.dart';
import 'package:movieapp/presentation/bloc/search/bloc.dart';
import 'package:movieapp/presentation/bloc/similar/bloc.dart';

import 'domain/usecases/find_all_favorites_movie_usecase.dart';
import 'presentation/bloc/movies/bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(
      DioBuilder.getInstance(options: BaseOptions(baseUrl: baseUrl)));
  injector.registerSingleton<AppDatabase>(AppDatabase());

  // Dependencies
  injector.registerSingleton<DataBaseImpl>(DataBaseImpl(injector()));

  injector.registerSingleton<MovieApi>(MovieApi(injector()));
  injector.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(injector(), injector()));

  // UseCases
  injector.registerSingleton<GetMoviesUseCase>(GetMoviesUseCase(injector()));
  injector.registerSingleton<GetMovieDetailUseCase>(
      GetMovieDetailUseCase(injector()));
  injector.registerSingleton<GetCastsUseCase>(GetCastsUseCase(injector()));
  injector.registerSingleton<GetSimilarMoviesUseCase>(
      GetSimilarMoviesUseCase(injector()));
  injector.registerSingleton<GetMoviesByGenreUseCase>(
      GetMoviesByGenreUseCase(injector()));
  injector.registerSingleton<FindMoviesUseCase>(FindMoviesUseCase(injector()));
  injector.registerSingleton<FindAllFavoriteMoviesUseCase>(
      FindAllFavoriteMoviesUseCase(injector()));
  injector
      .registerSingleton<DeleteMovieUseCase>(DeleteMovieUseCase(injector()));
  injector
      .registerSingleton<InsertMovieUseCase>(InsertMovieUseCase(injector()));

  // Blocs
  injector.registerFactory<MovieBloc>(() => MovieBloc(injector()));
  injector.registerFactory<MovieDetailBloc>(
      () => MovieDetailBloc(injector(), injector(), injector()));
  injector
      .registerFactory<MovieByGenreBloc>(() => MovieByGenreBloc(injector()));
  injector.registerFactory<MovieSearchingBloc>(
      () => MovieSearchingBloc(injector()));
  injector.registerFactory<FavoriteMovieBloc>(
      () => FavoriteMovieBloc(injector(), injector(), injector()));
}
