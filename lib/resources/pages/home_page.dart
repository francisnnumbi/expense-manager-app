import 'package:expense_manager/config/config.dart';
import 'package:expense_manager/config/constants.dart';
import 'package:expense_manager/database/mock_data.dart';
import 'package:expense_manager/resources/widgets/custom_bar.dart';
import 'package:expense_manager/resources/widgets/custom_chart.dart';
import 'package:expense_manager/resources/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});
 

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: kTitleExpandedHeight,
            leading: CustomBtn(
              onPress: () {},
              iconData: Icons.settings_outlined,
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                appTitleName,
                style: GoogleFonts.aBeeZee(
                  fontSize: kTitleFontSize,
                  letterSpacing: kTitleTextSpacing,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
              ),
            ),
            actions: [
              CustomBtn(
                onPress: () {},
                iconData: Icons.add_outlined,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, int index) => Container(
                margin: EdgeInsets.only(
                  left: 2.w,
                  right: 2.w,
                  top: 2.h,
                  bottom: 2.h,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(3.h),
                ),
                child: CustomChart(expenses: weeklySpending),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
