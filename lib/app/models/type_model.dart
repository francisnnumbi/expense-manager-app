import 'package:expense_manager/database/my_database.dart';
import 'package:expense_manager/main.dart';
import 'package:get/get.dart';

import 'cost_model.dart';

class TypeModel{
  final Category category;
  late List<CostModel> expenses = <CostModel>[];

  TypeModel({required this.category});

  get id => category.id;
  get name => category.name;
  get maxAmount => category.maxAmount;
}