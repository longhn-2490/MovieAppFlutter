import 'package:equatable/equatable.dart';

class DiscoverModel implements Equatable {
  final String image;
  final String name;
  final int id;

  DiscoverModel(this.image, this.name, this.id);
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

List<DiscoverModel> discovers = [
  DiscoverModel('assets/images/action.png', 'Action', 28),
  DiscoverModel('assets/images/music.png', 'Music', 10402),
  DiscoverModel('assets/images/romance.png', 'Romance', 10749),
  DiscoverModel('assets/images/science.png', 'Science Fiction', 878),
  DiscoverModel('assets/images/horror.png', 'Horror', 27),
  DiscoverModel('assets/images/war.png', 'War', 10752),
  DiscoverModel('assets/images/adventure.png', 'Adventure', 12),
  DiscoverModel('assets/images/comedy.png', 'Comedy', 35)
];
