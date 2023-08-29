import 'package:drift/drift.dart';
import 'package:expense_manager/database/my_database.dart';

import '../../../app/models/type_model.dart';
import '../../tables/categories.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables:[Categories])
class CategoriesDao extends DatabaseAccessor<MyDatabase> with _$CategoriesDaoMixin{
  CategoriesDao(MyDatabase db):super(db);

  //Stream<List<Category>> watchAllCategories2() => select(categories).watch();

  Stream<List<TypeModel>> watchAllCategories() => (select(categories)).map((row) {
    return TypeModel(category: row);
  }).watch();

  Future<int> insertCategory(CategoriesCompanion category) => into(categories).insert(category);
  Future<bool> updateCategory(CategoriesCompanion category) => update(categories).replace(category);
  Future<int> deleteCategory(CategoriesCompanion category) => delete(categories).delete(category);
}