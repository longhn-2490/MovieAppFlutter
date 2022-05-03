import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp/core/utils/color.dart';
import 'package:movieapp/presentation/bloc/moviebygenre/bloc.dart';
import 'package:movieapp/presentation/model/discover_model.dart';

import '../../../data/model/loadmore_data.dart';
import '../../../data/model/movie_data.dart';
import '../../../injector.dart';
import '../../widgets/movie_grid_view.dart';
import '../../widgets/utils.dart';

class MovieByGenreScreen extends StatefulWidget {
  final DiscoverModel model;

  const MovieByGenreScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<MovieByGenreScreen> createState() => _MovieByGenreScreenState();
}

class _MovieByGenreScreenState extends State<MovieByGenreScreen> {
  final pagingController = PagingController<int, MovieData>(firstPageKey: 1);
  final movieBloc = GetIt.I.get<MovieByGenreBloc>();

  @override
  void initState() {
    _fetchPage(1);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, widget.model),
      body: BlocProvider<MovieByGenreBloc>(
          create: (_) => movieBloc,
          child: BlocListener<MovieByGenreBloc, MovieByGenreState>(
            listener: (context, state) {
              if (state is MovieByGenreLoaded) {
                handleNextPage(state.loadMoreData);
              }
            },
            child: BlocBuilder<MovieByGenreBloc, MovieByGenreState>(
              builder: (context, state) {
                if (state is MovieByGenreLoading) {
                  return showLoader();
                }
                if (state is MovieByGenreLoaded) {
                  return buildMovies([]);
                }
                if (state is Error) {
                  return showRefresh();
                }
                return const SizedBox();
              },
            ),
          )),
    );
  }

  Widget buildMovies(List<MovieData> movies) {
    return MovieGridView(
      movies: [],
      pagingController: pagingController,
    );
  }

  AppBar _buildAppBar(BuildContext context, DiscoverModel model) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      shape: const Border(bottom: BorderSide(color: doveGray, width: 1)),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      title: Text(
        model.name,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            fontFamily: 'Helvetica',
            color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Hero(
              tag: model.name,
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(model.image),
              )),
        )
      ],
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    movieBloc.add(LoadMoviesByGenreEvent(widget.model.id.toString(), pageKey));
  }

  void handleNextPage(LoadMoreData<MovieData> data) {
    final isLastPage = data.page == data.totalPages;
    if (isLastPage) {
      pagingController.appendLastPage(data.data);
    } else {
      pagingController.appendPage(data.data, (data.page ?? 0) + 1);
    }
  }
}
