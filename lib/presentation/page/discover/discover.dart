import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/core/utils/color.dart';
import 'package:movieapp/presentation/model/discover_model.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Discover',
          style: TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildDiscoverItem(context, discovers[index]);
          },
          separatorBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 1,
              color: doveGray,
            );
          },
          itemCount: discovers.length),
    );
  }

  Widget _buildDiscoverItem(BuildContext context, DiscoverModel model) {
    return  InkWell(
      onTap: () {
        _onMoviePressed(context, model);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Hero(
              tag: model.name,
              child: Image(
                  image: AssetImage(
                    model.image,
                  )),
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              model.name,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold),
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.arrow_forward_ios,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _onMoviePressed(BuildContext context, DiscoverModel model) {
    Navigator.pushNamed(context, '/MovieByGenreView', arguments: model);
  }
}
