import 'package:movieapp/data/model/credit_data.dart';
import 'package:movieapp/data/remote/response/movie_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../../model/movie_data.dart';

part 'movie_api.g.dart';

@RestApi()
abstract class MovieApi {
  factory MovieApi(Dio dioBuilder) = _MovieApi;

  @GET('/movie/{type}')
  Future<MovieResponse> getMovies(@Path('type') String type,
      @Query('page') int page, @Query('api_key') String apiKey);

  @GET('/movie/{id}')
  Future<MovieData> getMovieDetail(
      @Query('api_key') String apiKey, @Path('id') final int id);

  @GET('/discover/movie')
  Future<MovieResponse> getMoviesByType(
      @Query('with_genres') final String genre, @Query('page') final int page);

  @GET('/movie/{movie_id}/credits')
  Future<CreditData> getCasts(@Path('movie_id') final int id);

  @GET('/movie/{movie_id}/similar')
  Future<MovieResponse> getSimilarMovies(@Path('movie_id') final int id);

  @GET('/search/movie')
  Future<MovieResponse> findMovies(@Query('query') final String query);
}
