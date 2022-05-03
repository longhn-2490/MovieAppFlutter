import 'package:moor_flutter/moor_flutter.dart';

class MovieTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get genre => text()();

  TextColumn get image => text()();

  IntColumn get vote => integer()();

  RealColumn get rating => real()();
}