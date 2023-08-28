import 'package:drift/drift.dart';
import 'package:expense_manager/database/tables/categories.dart';

@DataClassName('Cost')
class Costs extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get category => integer().references(Categories, #id).nullable()();
  RealColumn get cost => real().withDefault(const Constant(0.0))();
  TextColumn get date => text()();
}