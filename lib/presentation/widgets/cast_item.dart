import 'package:flutter/material.dart';
import 'package:movieapp/presentation/widgets/cicle_image.dart';

import '../../data/model/cast_data.dart';

class CastItem extends StatelessWidget {
  final CastData cast;

  const CastItem({Key? key, required this.cast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleImage(
          imageProvider: cast.getImagePath(),
          imageRadius: 40,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.only(left: 13),
          width: 80,
          child: Text(
            cast.name.toString(),
            softWrap: true,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
