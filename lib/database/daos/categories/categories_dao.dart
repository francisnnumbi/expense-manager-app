import 'package:drift/drift.dart';
import 'package:expense_manager/database/tables/my_database.dart';

import '../../tables/categories.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables:[Categories])
class CategoriesDao extends DatabaseAccessor<MyDatabase> with _$CategoriesDaoMixin{
  CategoriesDao(MyDatabase db):super(db);

  Stream<List<Category>> watchAllCategories() => select(categories).watch();

}