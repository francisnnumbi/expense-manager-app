import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../config/constants.dart';

class CustomBar extends StatelessWidget {
  CustomBar(
      {super.key,
      required this.day,
      required this.amountSpent,
      required this.expensive});

  final String day;
  final double amountSpent;
  final double expensive;
  final _maxBarHeight = 20.h;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / expensive * _maxBarHeight;

    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: GoogleFonts.aubrey(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: barHeight,
          width: 3.w,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(1.h),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          day,
          style: GoogleFonts.abel(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}
