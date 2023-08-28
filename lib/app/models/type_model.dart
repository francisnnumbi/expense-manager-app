import 'package:expense_manager/database/tables/my_database.dart';
import 'package:expense_manager/main.dart';
import 'package:get/get.dart';

import 'cost_model.dart';

class TypeModel{
  final Category category;
  final expenses = <CostModel>[].obs;

  TypeModel({required this.category});

  fillExpenses()async{
    expenses.value = await DB.costsDao.getCostsByCategoryId(id);
  }

  get id => category.id;
  get name => category.name;
  get maxAmount => category.maxAmount;
}