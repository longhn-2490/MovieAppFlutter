import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp/presentation/bloc/movies/bloc.dart';
import 'package:movieapp/presentation/widgets/top_rated_movie_thumbnail.dart';

import '../../../../data/model/loadmore_data.dart';
import '../../../../data/model/movie_data.dart';
import '../../../widgets/utils.dart';

class TopRatePage extends StatefulWidget {
  const TopRatePage({Key? key}) : super(key: key);

  @override
  State<TopRatePage> createState() => _TopRatePageState();
}

class _TopRatePageState extends State<TopRatePage>
    with AutomaticKeepAliveClientMixin {
  final pagingController = PagingController<int, MovieData>(firstPageKey: 1);
  final movieBloc = GetIt.I.get<MovieBloc>();

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
    return BlocProvider<MovieBloc>(
        create: (_) => movieBloc,
        child: BlocListener<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is Loaded) {
              handleNextPage(state.loadMoreData);
            }
          },
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is Loading) {
                return showLoader();
              }
              if (state is Loaded) {
                return buildMovies([]);
              }
              if (state is Error) {
                return showRefresh();
              }
              return const SizedBox();
            },
          ),
        ));
  }

  Widget buildMovies(List<MovieData> movies) {
    return PagedListView(
      builderDelegate: PagedChildBuilderDelegate<MovieData>(
          itemBuilder: (context, item, index) => GestureDetector(
              onTap: () {
                _onMoviePressed(context, item.id ?? -1);
              },
              child: TopRatedMovieThumbnail(movie:item))),
      pagingController: pagingController,
      shrinkWrap: true,
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onMoviePressed(BuildContext context, int id) {
    Navigator.pushNamed(context, '/MovieDetailsView', arguments: id);
  }

  Future<void> _fetchPage(int pageKey) async {
    movieBloc.add(LoadUpcomingMoviesEvent(page: pageKey));
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
