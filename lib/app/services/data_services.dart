import 'dart:developer';

import 'package:expense_manager/app/models/cost_model.dart';
import 'package:expense_manager/app/models/type_model.dart';
import 'package:expense_manager/database/my_database.dart';
import 'package:get/get.dart';

import '../../main.dart';

class DataServices extends GetxService{
  static DataServices get to => Get.find<DataServices>();
  static Future<void> init() async => await Get.putAsync<DataServices>(() async => DataServices());

  var costs = <CostModel>[].obs;
  var weeklySpendings = <CostModel>[].obs;
  var categories = <TypeModel>[].obs;

  saveCategory(CategoriesCompanion categ){
    DB.categoriesDao.insertCategory(categ);
  }

  saveCost(CostsCompanion cost){
    DB.costsDao.insertCost(cost);
  }

  @override
  void onReady() {
    DB.categoriesDao.watchAllCategories().listen((event) {
      categories.value = event;
     // log(categories.value.toString());
      for(var category in categories){
        category.fillExpenses();
      }
    });

    /*DB.costsDao.watchOnlyCosts().listen((event) {
      weeklySpendings.value = event;
    });*/

    DB.costsDao.watchAllCosts().listen((event) {
      costs.value = event;
      for(var category in categories){
        category.fillExpenses();
      }

      // get same date : retrieve day and add up amount
      weeklySpendings.value = event;
    });
    super.onReady();
  }
}