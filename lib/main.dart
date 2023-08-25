import 'package:expense_manager/config/config.dart';
import 'package:expense_manager/config/constants.dart';
import 'package:expense_manager/resources/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(

      builder: (context, orientation, deiceType) {
        return MaterialApp(
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
          home:  HomePage(),
        );
      },
    );
  }
}
