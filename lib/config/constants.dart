import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const Color kScaffoldColor = Color(0xFF1C2833);
const Color kPrimaryColor = Color(0xFF17202A);
const Color kSecondaryColor = Color(0xFF32B3DF);
const Color kTextColor = Color(0xFFFFFFFF);

final double kTitleFontSize = 12.sp;
const double kTitleTextSpacing = 1.0;
final double kTitleExpandedHeight = 10.h;

Color setupColor(double percentage){
  if (percentage >= 0.50){
    return kScaffoldColor;
  }else if (percentage >= 0.25){
    return Colors.orange;
  }
  return Colors.red;
}