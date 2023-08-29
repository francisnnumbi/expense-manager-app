import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants.dart';
import '../../widgets/icon_btn.dart';

class AddCost extends StatefulWidget {
  static String route = '/add_cost';
  const AddCost({super.key});

  @override
  State<AddCost> createState() => _AddCostState();
}

class _AddCostState extends State<AddCost> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController costInput = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CustomBtn(
          onPress: () {
            Get.back();
          },
          iconData: Icons.arrow_back_outlined,
        ),
        title: Text(
          'New Cost',
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
            _buildExpenseForm(),
          ],
        ),
      ),
    );
  }

  _buildExpenseForm() {

    return Form(
      key: _formKey,
      child: Container(
        padding: kPadding,
        child: Column(
          children: [
            TextFormField(
              controller: nameInput,
              style: GoogleFonts.atma(
                fontWeight: FontWeight.w600,
                color: kTextColor,
                fontSize: 14.sp,
                letterSpacing: 2.0,
              ),
              decoration: InputDecoration(
                labelText: 'Cost',
                filled: true,
                fillColor: kPrimaryColor,
                labelStyle: GoogleFonts.atma(
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                  fontSize: 14.sp,
                  letterSpacing: 2.0,
                ),

                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 2.h,),
            TextFormField(
              controller: costInput,
              style: GoogleFonts.atma(
                fontWeight: FontWeight.w600,
                color: kTextColor,
                fontSize: 14.sp,
                letterSpacing: 2.0,
              ),
              decoration: InputDecoration(
                labelText: 'Amount',
                filled: true,
                fillColor: kPrimaryColor,
                labelStyle: GoogleFonts.atma(
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                  fontSize: 14.sp,
                  letterSpacing: 2.0,
                ),

                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
