// import 'package:chopper/chopper.dart';
// import 'package:movieapp/data/model/credit_data.dart';
// import 'package:movieapp/data/remote/response/movie_response.dart';
// import '../../../core/utils/constants.dart';
// part 'movie_api.chopper.dart';
//
// @ChopperApi()
// abstract class MovieApi extends ChopperService{
//   @Get(path: 'movie/upcoming')
//   Future<Response<MovieResponse>> fetchUpcomingMovies(@Query('page') int page);
//
//   @Get(path: 'movie/now_playing')
//   Future<Response<MovieResponse>> fetchNowPlayingMovies();
//
//   @Get(path: 'movie/top_rated')
//   Future<Response<MovieResponse>> fetchTopRatedMovies();
//
//   @Get(path: 'movie/popular')
//   Future<Response<MovieResponse>> fetchPopularMovies();
//
//   @Get(path: 'movie/{id}')
//   Future<Response<MovieResponse>> getMovieDetail(@Path('id') final int id);
//
//   @Get(path: 'discover/movie')
//   Future<Response<MovieResponse>> fetchMoviesByType(@Query('with_genres') final String genre);
//
//   @Get(path: 'upcoming')
//   Future<Response<CreditData>> getCasts();
//
//   static MovieApi create() {
//     final client = ChopperClient(
//       baseUrl: baseUrl,
//       interceptors: [_addQuery, HttpLoggingInterceptor()],
//       converter: const JsonConverter(),
//       errorConverter: const JsonConverter(),
//       services: [
//         _$MovieApi(),
//       ],
//     );
//     return _$MovieApi(client);
//   }
// }
//
// Request _addQuery(Request req) {
//   final params = Map<String, dynamic>.from(req.parameters);
//   params['api_key'] = apiKey;
//   return req.copyWith(parameters: params);
// }
