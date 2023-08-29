import 'dart:developer';

import 'package:expense_manager/app/services/data_services.dart';
import 'package:expense_manager/database/my_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:drift/drift.dart' as d;

import '../../../config/constants.dart';
import '../../widgets/icon_btn.dart';

class AddCategory extends StatefulWidget {
  static String route = '/add_category';

  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController maxAmountInput = TextEditingController();

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
          'New Category',
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
              _saveCategory();
            },
            iconData: Icons.add_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCategoryForm(),
          ],
        ),
      ),
    );
  }

  _buildCategoryForm() {
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
              validator: (va) {
                if (va!.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Category',
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
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              controller: maxAmountInput,
              style: GoogleFonts.atma(
                fontWeight: FontWeight.w600,
                color: kTextColor,
                fontSize: 14.sp,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.end,
              validator: (va) {
                if (va!.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Max Amount',
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

  _saveCategory() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    //Do the actual saving here
    CategoriesCompanion cc = CategoriesCompanion(
      name: d.Value<String>(nameInput.text),
      maxAmount: d.Value<double>(double.parse(maxAmountInput.text)),
    );
    DataServices.to.saveCategory(cc);
    Get.back();
    log(cc.toString());
  }
}
