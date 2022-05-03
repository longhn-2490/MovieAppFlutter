import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/core/utils/color.dart';
import 'package:movieapp/core/utils/enum.dart';
import 'package:movieapp/presentation/bloc/favoritemovie/bloc.dart';
import 'package:movieapp/presentation/bloc/navigationbar/navigation_bar_cubit.dart';
import 'package:movieapp/presentation/page/discover/discover.dart';
import 'package:movieapp/presentation/page/favorite/favorite.dart';
import 'package:movieapp/presentation/page/home/home.dart';
import 'package:movieapp/presentation/page/tvshow/show.dart';

import '../injector.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = <Widget>[];

  @override
  void initState() {
    super.initState();
    pageList.add(const HomeScreen());
    pageList.add(const DiscoverScreen());
    pageList.add(const ShowScreen());
    pageList.add(const FavoriteScreen());
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((NavigationCubit cubit) => cubit.state.navbarItem);
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: buildBottomBar(context, selectedTab),
      body: IndexedStack(
        index: selectedTab.index,
        children: pageList,
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => {
          print('here'),
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
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          padding: const EdgeInsets.only(top: 10),
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
        ));
  }

  Widget buildBottomBar(BuildContext context, NavbarItem currentTab) {
    return SizedBox(
      height: 90,
      child: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        notchMargin: 3,
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 0.5, color: grey))),
          child: BottomNavigationBar(
            currentIndex: currentTab.index,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: lightBlue,
            selectedFontSize: 13,
            unselectedFontSize: 13,
            backgroundColor: darkBlue,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 10),
                    child: SvgPicture.asset('assets/images/film.svg',
                        color: currentTab.index == 0 ? blue : lightBlue,
                        semanticsLabel: 'Movie'),
                  ),
                  label: 'Movie'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 14, bottom: 10),
                    child: SvgPicture.asset('assets/images/discover.svg',
                        color: currentTab.index == 1 ? blue : lightBlue,
                        semanticsLabel: 'Discover',
                        fit: BoxFit.fill),
                  ),
                  label: 'Discover'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 10),
                    child: SvgPicture.asset('assets/images/live.svg',
                        color: currentTab.index == 2 ? blue : lightBlue,
                        semanticsLabel: 'TV Show',
                        fit: BoxFit.fill),
                  ),
                  label: 'TV Show'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 10),
                    child: SvgPicture.asset('assets/images/favorite.svg',
                        color: currentTab.index == 3 ? blue : lightBlue,
                        semanticsLabel: 'Favorite',
                        fit: BoxFit.fill),
                  ),
                  label: 'Favorite'),
            ],
            onTap: (index) {
              context.read<NavigationCubit>().setTab(index);
            },
            selectedItemColor: blue,
          ),
        ),
      ),
    );
  }
}

//
// BottomNavigationBar(
// currentIndex: state.index,
// items: [
// BottomNavigationBarItem(
// icon: SvgPicture.asset('assets/images/film.svg',
// color: _selectedIndex == 0 ? blue : Colors.lightBlue,
// semanticsLabel: 'Movie'),
// label: 'Movie'),
// BottomNavigationBarItem(
// icon: SvgPicture.asset('assets/images/discover.svg',
// color: _selectedIndex == 1 ? blue : Colors.lightBlue,
// semanticsLabel: 'Discover'),
// label: 'Discover'),
// BottomNavigationBarItem(
// icon: SvgPicture.asset('assets/images/live.svg',
// color: _selectedIndex == 2 ? blue : Colors.lightBlue,
// semanticsLabel: 'TV Show'),
// label: 'TV Show'),
// BottomNavigationBarItem(
// icon: SvgPicture.asset('assets/images/favorite.svg',
// color: _selectedIndex == 2 ? blue : Colors.lightBlue,
// semanticsLabel: 'Favorite'),
// label: 'Favorite'),
// ],
// onTap: (index) {
// if (index == 0) {
// navigateTab(NavbarItem.home);
// } else if (index == 1) {
// navigateTab(NavbarItem.discover);
// } else if (index == 2) {
// navigateTab(NavbarItem.show);
// } else {
// navigateTab(NavbarItem.favorite);
// }
// },
// );
