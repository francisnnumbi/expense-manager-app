import 'package:expense_manager/app/models/cost_model.dart';
import 'package:expense_manager/database/my_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../config/constants.dart';
import 'custom_bar.dart';
import 'icon_btn.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({super.key, required  this.expenses});
  final List<CostModel> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((CostModel expense) {
      if(expense.amount > mostExpensive)mostExpensive = expense.amount;
    });
    return  Padding(
      padding: EdgeInsets.all(1.w),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: GoogleFonts.abel(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: kTextColor,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBtn(
                  onPress: () {},
                  iconData: Icons.arrow_back_outlined),
              Text(
                'Nov 10, 2020 - Nov 18, 2020',
                style: GoogleFonts.atma(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                    letterSpacing: 1.0),
              ),
              CustomBtn(
                  onPress: () {},
                  iconData: Icons.arrow_forward_outlined),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: expenses.map((exp) =>
                CustomBar(
                  day: exp.date,
                  amountSpent: exp.amount,
                  expensive: mostExpensive,
                ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}


////// old ///////
class CustomChart2 extends StatelessWidget {
  const CustomChart2({super.key, required  this.expenses});
  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if(price > mostExpensive)mostExpensive = price;
    });
    return  Padding(
      padding: EdgeInsets.all(1.w),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: GoogleFonts.abel(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: kTextColor,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBtn(
                  onPress: () {},
                  iconData: Icons.arrow_back_outlined),
              Text(
                'Nov 10, 2020 - Nov 18, 2020',
                style: GoogleFonts.atma(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                    letterSpacing: 1.0),
              ),
              CustomBtn(
                  onPress: () {},
                  iconData: Icons.arrow_forward_outlined),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomBar(
                day: 'Su',
                amountSpent: expenses[0],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Mo',
                amountSpent: expenses[1],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Tu',
                amountSpent: expenses[2],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'We',
                amountSpent: expenses[3],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Th',
                amountSpent: expenses[4],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Fr',
                amountSpent: expenses[5],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Sa',
                amountSpent: expenses[6],
                expensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
