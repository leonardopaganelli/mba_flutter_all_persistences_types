
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mba_flutter_all_persistences_types/floor/daos/bookDao.dart';
import 'package:mba_flutter_all_persistences_types/floor/models/book.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'appDatabase.g.dart';

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
}