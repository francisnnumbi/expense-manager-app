import 'package:expense_manager/config/config.dart';
import 'package:expense_manager/config/constants.dart';
import 'package:expense_manager/database/my_database.dart';
import 'package:expense_manager/resources/pages/home_page.dart';
import 'package:expense_manager/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/services/data_services.dart';

final DB = MyDatabase();
 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async{
  await DataServices.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(

      builder: (context, orientation, deiceType) {
        return GetMaterialApp(
          title: appName,
          theme: ThemeData(
            scaffoldBackgroundColor: kScaffoldColor,
            appBarTheme: AppBarTheme(
              backgroundColor: kPrimaryColor,
              iconTheme: IconThemeData(
                size: 23.sp,
                color: kSecondaryColor,
              ),
            ),
            useMaterial3: true,
          ),
         initialRoute: HomePage.route,
          getPages: Routes.routes,
        );
      },
    );
  }
}
