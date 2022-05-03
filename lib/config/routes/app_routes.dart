import 'package:flutter/material.dart';
import 'package:movieapp/presentation/model/discover_model.dart';
import 'package:movieapp/presentation/page/moviebygenre/movie_by_genre.dart';
import 'package:movieapp/presentation/page/moviedetail/movie_detail.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Scaffold());
      case '/MovieDetailsView':
        return _materialRoute(MovieDetail(id: settings.arguments as int));
      case '/MovieByGenreView':
        return _materialRoute(MovieByGenreScreen(
          model: settings.arguments as DiscoverModel
        ));
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
