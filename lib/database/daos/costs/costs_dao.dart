import 'package:drift/drift.dart';
import 'package:expense_manager/database/my_database.dart';

import '../../../app/models/cost_model.dart';
import '../../tables/costs.dart';

part 'costs_dao.g.dart';

@DriftAccessor(tables: [Costs])
class CostsDao extends DatabaseAccessor<MyDatabase> with _$CostsDaoMixin {
  CostsDao(MyDatabase db) : super(db);

  Stream<List<Cost>> watchOnlyCosts() => (select(costs)).watch();

  Stream<List<CostModel>> watchAllCosts() => (select(costs)).map((row) {
    return CostModel(cost: row);}).watch();

/*  Stream<List<CostModel>> watchAllCosts() => (select(costs).join([
    leftOuterJoin(db.categories, db.categories.id.equalsExp(costs.category))
  ])).map((row) {
    return CostModel(
        cost: row.readTable(costs),
        category: row.readTableOrNull(db.categories));
  }).watch();*/

  Future<List<Cost>> getCostsByCategoryId(int id) =>
      (select(costs)..where((t) => t.category.equals(id))).get();

  Future<int> insertCost(CostsCompanion cost) => into(costs).insert(cost);
  Future<bool> updateCost(CostsCompanion cost) => update(costs).replace(cost);
  Future<int> deleteCost(CostsCompanion cost) => delete(costs).delete(cost);
}
