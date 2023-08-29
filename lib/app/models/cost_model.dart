import 'package:drift/drift.dart';
import 'package:expense_manager/database/my_database.dart';
import 'package:intl/intl.dart';

class CostModel{
  final Cost cost;
  final Category? category;

  CostModel({required this.cost, this.category});

get id => cost.id;
get name => cost.name;
get date => cost.date;
get amount => cost.cost;
get day => DateFormat('EE').format(DateTime.parse(date));
}