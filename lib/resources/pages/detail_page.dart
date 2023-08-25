import 'package:expense_manager/app/models/type_model.dart';
import 'package:expense_manager/config/constants.dart';
import 'package:expense_manager/resources/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../app/models/cost_model.dart';
import '../widgets/circle_painter.dart';

class DetailPage extends StatefulWidget {
  final TypeModel? typeModel;

  const DetailPage({super.key, this.typeModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double tAmountSpent = 0;
    widget.typeModel!.expenses!.forEach((CostModel expense) {
      tAmountSpent += expense.cost!;
    });
    final double amountLeft = widget.typeModel!.maxAmount! - tAmountSpent;
    final double percentage = amountLeft / widget.typeModel!.maxAmount!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CustomBtn(
          onPress: () {
            Navigator.pop(context);
          },
          iconData: Icons.arrow_back_outlined,
        ),
        title: Text(
          widget.typeModel!.name!,
          style: GoogleFonts.aBeeZee(
            fontSize: kTitleFontSize,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
        actions: [
          CustomBtn(
            onPress: () {
              Navigator.pop(context);
            },
            iconData: Icons.add_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: kMargin,
              padding: kPadding,
              height: 35.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kRadius,
              ),
              child: CustomPaint(
                foregroundPainter: CirclePainter(
                  bgColor: Colors.grey[200],
                  lineColor: setupColor(percentage),
                  percentage: percentage,
                  width: 5.w,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(0)} / \$${widget.typeModel!.maxAmount!.toStringAsFixed(0)}',
                  style: GoogleFonts.aubrey(
                    fontWeight: FontWeight.w500,
                    color: kSecondaryColor,
                    fontSize: 21.sp,
                    letterSpacing: 2.0,
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
