import 'package:drift/drift.dart';
import 'package:expense_manager/app/models/cost_model.dart';
import 'package:expense_manager/database/my_database.dart';
import 'package:rxdart/rxdart.dart';

import '../../../app/models/type_model.dart';
import '../../../main.dart';
import '../../tables/categories.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables:[Categories])
class CategoriesDao extends DatabaseAccessor<MyDatabase> with _$CategoriesDaoMixin{
  CategoriesDao(MyDatabase db):super(db);

  //Stream<List<Category>> watchAllCategories2() => select(categories).watch();

  Stream<List<TypeModel>> watchAllCategories() => (select(categories)).map((row) {
    return TypeModel(category: row);
  }).watch();

  Stream<List<TypeModel>> watchAllCategoriesWithCosts(){
    final categs = watchAllCategories();
    final costs = DB.costsDao.watchAllCosts();
    return Rx.combineLatest2(categs, costs,
            (List<TypeModel> p, List<CostModel> ins) {
          return p.map((categ) {
            categ.expenses = ins.where((cost) => cost.categoryId == categ.id).toList();
            return categ;
          }).toList();
        });

  }

  Future<int> insertCategory(CategoriesCompanion category) => into(categories).insert(category);
  Future<bool> updateCategory(CategoriesCompanion category) => update(categories).replace(category);
  Future<int> deleteCategory(CategoriesCompanion category) => delete(categories).delete(category);
}