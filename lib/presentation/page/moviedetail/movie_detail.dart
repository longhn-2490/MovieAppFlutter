import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/core/utils/color.dart';
import 'package:movieapp/presentation/bloc/favoritemovie/bloc.dart';
import 'package:movieapp/presentation/bloc/moviedetail/bloc.dart';
import 'package:movieapp/presentation/widgets/cast_item.dart';
import 'package:movieapp/presentation/widgets/rating_bar.dart';
import 'package:movieapp/presentation/widgets/utils.dart';

import '../../../data/model/cast_data.dart';
import '../../../data/model/movie_data.dart';
import '../../../injector.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late ExpandableController controller;
  List<MovieData> favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    controller = ExpandableController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailBloc>(
          create: (_) =>
          injector()
            ..add(LoadMovieDetailEvent(widget.id))..add(
              LoadCastsEvent(widget.id))..add(
              LoadSimilarMoviesEvent(widget.id)),
        )
      ],
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white),
          ),
          body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MovieDetailBloc, MovieDetailState>(
                buildWhen: (pre, cur) {
                  return cur is MovieDetailLoaded;
                },
                builder: (context, state) {
                  // if (state is MovieLoading) {
                  //   return showLoader();
                  // }
                  if (state is MovieDetailLoaded) {
                    final movie = state.movie;
                    return _buildDetail(context, movie);
                  }
                  return Container();
                },
              ),
              BlocBuilder<MovieDetailBloc, MovieDetailState>(
                  buildWhen: (pre, cur) {
                    return cur is CastsLoaded;
                  }, builder: (context, state) {
                if (state is CastsLoaded) {
                  return _buildCasts(state.casts);
                }
                return const SizedBox();
              }),
              BlocBuilder<MovieDetailBloc, MovieDetailState>(
                  buildWhen: (pre, cur) {
                    return cur is SimilarMovieLoaded;
                  }, builder: (context, state) {
                if (state is SimilarMovieLoaded) {
                  return _buildSimilarMovies(state.movies);
                }
                return const SizedBox();
              })
            ],
          ),
          BlocBuilder<MovieDetailBloc, MovieDetailState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      child: showLoader());
                }
                return const SizedBox();
              })
        ],
      ),
    );
  }

  Widget _buildCasts(List<CastData> casts) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: _buildText('Cast', 20, Colors.white)),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
          width: 63,
          height: 3,
          color: Colors.white,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              shrinkWrap: true,
              itemCount: casts.length,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CastItem(
                      cast: casts[index],
                    ));
              }),
        ),
      ],
    );
  }

  Widget _buildDetail(BuildContext context, MovieData movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: movie.getBackImagePath(),
              width: double.infinity,
              height: 265,
              fit: BoxFit.cover,
            ),
            _buildPlayIcon(),
            Positioned(
              bottom: -250,
              left: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: movie.getImagePath(),
                        width: 135,
                        height: 241,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15),
                          child: _buildText('Description', 20, Colors.white)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 150,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.7,
                  padding: const EdgeInsets.only(top: 30, left: 25, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child:
                          _buildText(movie.title, 21, Colors.orange)),
                      IconButton(
                        onPressed: () {
                          final bloc = BlocProvider.of<FavoriteMovieBloc>(context);

                          final isFavorited = bloc.favoriteMovies.any((e) => e.id == movie.id);
                          (isFavorited)  ? bloc.add((DeleteFavoriteMovieEvent(movie.id!))) :
                          bloc.add(InsertFavoriteMovieEvent(movie));

                          setState(() {

                          });
                        },
                        icon: (context.select((FavoriteMovieBloc bloc) =>
                        bloc.favoriteMovies).any((e) => e.id == movie.id))
                            ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                            : const Icon(Icons.favorite)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MovieRatingBar(ratingCount: movie.voteAverage ?? 0),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildText(movie.getCompanyName(), 18, Colors.white),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildText(movie.getGenre(), 18, Colors.white),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildText(movie.releaseDate, 18, Colors.white),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.8,
                      padding: const EdgeInsets.only(top: 20, left: 6),
                      child: ExpandableNotifier(
                        controller: controller,
                        child: Column(
                          children: [
                            Expandable(
                              collapsed: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.toggle();
                                  });
                                },
                                child: Text(
                                  movie.overview.toString(),
                                  style: const TextStyle(
                                      color: dust,
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                              expanded: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.toggle();
                                  });
                                },
                                child: Text(
                                  movie.overview.toString(),
                                  style: const TextStyle(
                                      color: dust,
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.toggle();
                            });
                          },
                          child: SvgPicture.asset((controller.expanded)
                              ? 'assets/images/collapse.svg'
                              : 'assets/images/expand.svg'),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 3,
          color: comet,
        ),
      ],
    );
  }

  Widget _buildSimilarMovies(List<MovieData> movies) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: _buildText('Similar movie', 20, Colors.white)),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
          width: 63,
          height: 3,
          color: Colors.white,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: () {
                        _onMoviePressed(context, movies[index].id ?? -1);
                      },
                      child: CachedNetworkImage(
                        height: 188,
                        width: 125,
                        imageUrl: movies[index].getImagePath(),
                      ),
                    ));
              }),
        ),
      ],
    );
  }

  Widget _buildPlayIcon() {
    return Container(
      alignment: Alignment.center,
      width: 61,
      height: 61,
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      child: const Icon(
        FontAwesomeIcons.play,
        size: 21,
      ),
    );
  }

  Widget _buildText(String? content, double size, Color color) {
    return Text(
      content.toString(),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          fontSize: size,
          fontFamily: 'Charter',
          fontWeight: FontWeight.bold,
          color: color),
    );
  }

  void _onMoviePressed(BuildContext context, int id) {
    Navigator.pushNamed(context, '/MovieDetailsView', arguments: id);
  }

  void _insertMovie(BuildContext context, MovieData movie) {
    context.read<FavoriteMovieBloc>().add(InsertFavoriteMovieEvent(movie));
  }
}
