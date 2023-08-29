import 'package:drift/drift.dart';
import 'package:expense_manager/database/tables/my_database.dart';

import '../../../app/models/cost_model.dart';
import '../../tables/costs.dart';

part 'costs_dao.g.dart';

@DriftAccessor(tables: [Costs])
class CostsDao extends DatabaseAccessor<MyDatabase> with _$CostsDaoMixin {
  CostsDao(MyDatabase db) : super(db);

  Stream<List<Cost>> watchAllCosts() => select(costs).watch();

  Future<List<CostModel>> getCostsByCategoryId(int id) =>
      ((select(costs)..where((t) => t.category.equals(id))).join([
        leftOuterJoin(db.categories, db.categories.id.equalsExp(costs.category))
      ])).map((row) {
        return CostModel(
            cost: row.readTable(costs),
            category: row.readTableOrNull(db.categories));
      }).get();

  Future<int> insertCost(CostsCompanion cost) => into(costs).insert(cost);
  Future<bool> updateCost(CostsCompanion cost) => update(costs).replace(cost);
  Future<int> deleteCost(CostsCompanion cost) => delete(costs).delete(cost);
}
