import 'package:floor/floor.dart';
import 'package:mba_flutter_all_persistences_types/floor/models/book.dart';

@dao
abstract class BookDao {
  
  @Query("Select * from Book")
  Future<List<Book>> findAll();

  @insert
  Future<int> insertBook(Book book);

  @delete
  Future<int> deleteBook(Book book);
}