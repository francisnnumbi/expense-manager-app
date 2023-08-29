import 'package:drift/drift.dart';
import 'package:expense_manager/database/tables/my_database.dart';

import '../../tables/categories.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables:[Categories])
class CategoriesDao extends DatabaseAccessor<MyDatabase> with _$CategoriesDaoMixin{
  CategoriesDao(MyDatabase db):super(db);

  Stream<List<Category>> watchAllCategories() => select(categories).watch();

  Future<int> insertCost(CategoriesCompanion category) => into(categories).insert(category);
  Future<bool> updateCost(CategoriesCompanion category) => update(categories).replace(category);
  Future<int> deleteCost(CategoriesCompanion category) => delete(categories).delete(category);
}