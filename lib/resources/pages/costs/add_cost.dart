import 'dart:developer';

import 'package:expense_manager/app/models/type_model.dart';
import 'package:expense_manager/app/services/data_services.dart';
import 'package:expense_manager/database/my_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:drift/drift.dart' as d;

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
  final TextEditingController dateInput = TextEditingController();
  late int categoryValue ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateInput.text = DateTime.now().toString().split(' ')[0];
    categoryValue = DataServices.to.categories.value.firstOrNull!.category.id;
  }

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
              _saveCost();
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
              validator: (va) {
                if (va!.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
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
            SizedBox(
              height: 2.h,
            ),
            DropdownButtonFormField(
              value: categoryValue,
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

              dropdownColor: kPrimaryColor,
              items: DataServices.to.categories
                  .map(
                    (categ) => DropdownMenuItem<int>(
                      value: categ.id,
                      child: Text(
                        categ.name,
                        style: GoogleFonts.atma(
                          fontWeight: FontWeight.w500,
                          color: kTextColor,
                          fontSize: 12.sp,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                categoryValue = val!;
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              controller: costInput,
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
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              controller: dateInput,
              //initialValue: dating.toString(),
              readOnly: true,
              style: GoogleFonts.atma(
                fontWeight: FontWeight.w600,
                color: kTextColor,
                fontSize: 14.sp,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.end,
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      dateInput.text = value.toString().split(' ')[0];
                    });
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Date',
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

  _saveCost() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    //Do the actual saving here
    CostsCompanion cc = CostsCompanion(
      name: d.Value<String>(nameInput.text),
      cost: d.Value<double>(double.parse(costInput.text)),
      category: d.Value<int>(categoryValue),
      date: d.Value<String>(dateInput.text),
    );
    DataServices.to.saveCost(cc);
    Get.back();
    log(cc.toString());
  }
}
