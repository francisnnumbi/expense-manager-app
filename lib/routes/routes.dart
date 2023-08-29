import 'package:expense_manager/app/models/type_model.dart';
import 'package:expense_manager/resources/pages/costs/add_cost.dart';
import 'package:expense_manager/resources/pages/detail_page.dart';
import 'package:expense_manager/resources/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/pages/categories/add_category.dart';

class Routes {
  static List<GetPage> routes = [
    GetPage(
      name: HomePage.route,
      page: () => HomePage(),
    ),
    GetPage(
      name: DetailPage.route,
      page: () =>  DetailPage(typeModel: Get.arguments['category'],),
     // arguments:
    ),
    GetPage(
      name: AddCost.route,
      page: () => const AddCost(),
      //arguments:
    ),
    GetPage(
      name: AddCategory.route,
      page: () => const AddCategory(),
      //arguments:
    ),
  ];
}
