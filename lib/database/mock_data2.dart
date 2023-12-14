import 'dart:math';

import 'package:expense_manager/app/models/cost_model.dart';
import 'package:expense_manager/database/my_database.dart';

import '../app/models/type_model.dart';

final rand = Random(20);
final List<double> weeklySpending = [
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
];

_generateExpenses(){
  List<CostModel> costModel =[
     CostModel(cost: Cost(id: rand.nextInt(1000), name: 'Item 0', category: null, cost: rand.nextDouble()*90, date: DateTime.now().toString())),
     CostModel(cost: Cost(id: rand.nextInt(1000), name: 'Item 1', category: null, cost: rand.nextDouble()*90, date: DateTime.now().toString())),
     CostModel(cost: Cost(id: rand.nextInt(1000), name: 'Item 2', category: null, cost: rand.nextDouble()*90, date: DateTime.now().toString())),
     CostModel(cost: Cost(id: rand.nextInt(1000), name: 'Item 3', category: null, cost: rand.nextDouble()*90, date: DateTime.now().toString())),
     CostModel(cost: Cost(id: rand.nextInt(1000), name: 'Item 4', category: null, cost: rand.nextDouble()*90, date: DateTime.now().toString())),
     CostModel(cost: Cost(id: rand.nextInt(1000), name: 'Item 5', category: null, cost: rand.nextDouble()*90, date: DateTime.now().toString())),
  ];
  return costModel;
}

List<TypeModel> typeNames =[

];