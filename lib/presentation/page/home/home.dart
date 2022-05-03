import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movieapp/core/utils/color.dart';
import 'package:movieapp/presentation/page/home/nowplaying/now_playing.dart';
import 'package:movieapp/presentation/page/home/popular/popular.dart';
import 'package:movieapp/presentation/page/home/toprate/top_rate.dart';
import 'package:movieapp/presentation/page/home/upcoming/upcoming.dart';
import 'package:movieapp/presentation/page/search/custom_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: const Padding(
            padding: EdgeInsets.only(top: 25),
            child: TabBarView(
              children: [
                UpComingPage(),
                PopularPage(),
                TopRatePage(),
                NowPlayingPage()
              ],
            ),
          ),
        ));
  }

  Widget buildSearchBar(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => {
          showSearch(context: context, delegate: CustomSearchDelegate()),
        },
        child: Container(
          height: 30,
          color: cloudBurst,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              const Text(
                'Search',
                style: TextStyle(
                    fontSize: 15,
                    color: havelockBlue,
                    fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset('assets/images/search.svg')
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'MovieX',
                  style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Charter',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 40,
                ),
                buildSearchBar(context),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBar(
                indicatorColor: blazeOrange,
                isScrollable: true,
                unselectedLabelColor: Colors.white,
                labelColor: blazeOrange,
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: 'charter',
                    color: blazeOrange,
                    fontWeight: FontWeight.bold),
                tabs: [
                  Tab(icon: SizedBox(), child: Text('UPCOMING')),
                  Tab(icon: SizedBox(), text: 'POPULAR'),
                  Tab(icon: SizedBox(), text: 'TOPRATE'),
                  Tab(icon: SizedBox(), text: 'NOWPLAYING'),
                ]),
          ),
        ]));
  }
}
