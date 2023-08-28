import 'package:drift/drift.dart';
import 'package:expense_manager/database/tables/my_database.dart';

class CostModel{
  final Cost cost;
  final Category? category;

  CostModel({required this.cost, this.category});

get id => cost.id;
get name => cost.name;
get date => cost.date;
get amount => cost.cost;
}