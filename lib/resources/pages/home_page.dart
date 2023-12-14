import 'package:expense_manager/app/services/data_services.dart';
import 'package:expense_manager/config/config.dart';
import 'package:expense_manager/config/constants.dart';

//import 'package:expense_manager/database/mock_data.dart';
import 'package:expense_manager/resources/pages/costs/add_cost.dart';
import 'package:expense_manager/resources/pages/detail_page.dart';
import 'package:expense_manager/resources/widgets/custom_chart.dart';
import 'package:expense_manager/resources/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../app/models/type_model.dart';
import 'categories/add_category.dart';

class HomePage extends StatefulWidget {
  static String route = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return CustomScrollView(
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
                  onPress: () {
                    // Get.toNamed(AddCost.route);
                    _popDialog();
                  },
                  iconData: Icons.add_outlined,
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1+DataServices.to.categories.length,
                    (context, int index) {
                   if (index == 0) {
                  return Container(
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
                    child: CustomChart(expenses: DataServices.to.weeklySpendings),
                  );
                } else {

                    final TypeModel typeModel =
                    DataServices.to.categories[index -1];
                    double tAmountSpent = 0;
                    for (var expense in typeModel.expenses) {
                      tAmountSpent += expense.amount!;
                    }
                    return _buildCategories(typeModel, tAmountSpent);
                  }
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  _popDialog() {
    Get.defaultDialog(
        title: 'Add new',
        titleStyle: GoogleFonts.aBeeZee(
          fontSize: 16.sp,
          letterSpacing: kTitleTextSpacing,
          fontWeight: FontWeight.w500,
          color: kTextColor,
        ),
        contentPadding: EdgeInsets.all(1.2.h),
        middleText: 'What are you trying to do ?',
        middleTextStyle: GoogleFonts.abel(
          fontSize: 13.sp,
          letterSpacing: kTitleTextSpacing,

          color: kTextColor,
        ),
        backgroundColor: kPrimaryColor,
        actions: [
          OutlinedButton(onPressed: () {
            Get.back();
            Get.toNamed(AddCost.route);
          }, child: Text('Expense', style: GoogleFonts.abel(
            fontSize: kTitleFontSize,
            letterSpacing: kTitleTextSpacing,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),)),
          OutlinedButton(onPressed: () {
            Get.back();
            Get.toNamed(AddCategory.route);
          }, child: Text('Category', style: GoogleFonts.abel(
            fontSize: kTitleFontSize,
            letterSpacing: kTitleTextSpacing,
            fontWeight: FontWeight.w500,
            color: kSecondaryColor,
          ),)),
        ]
    );
  }

  _buildCategories(TypeModel category, double tAmountSpent) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(DetailPage.route, arguments: {'category': category});
        /* Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              typeModel: category,
            ),
          ),
        );*/
      },
      child: Container(
        width: 100.w,
        height: 14.h,
        margin: kMargin,
        padding: kPadding,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: kRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name!,
                  style: GoogleFonts.abel(
                    fontSize: 13.5.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  '\$${(category.maxAmount! - tAmountSpent).toStringAsFixed(
                      2)} / \$${category.maxAmount!.toStringAsFixed(2)}',
                  style: GoogleFonts.atma(
                    fontSize: 12.5.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            LayoutBuilder(builder: (context, constraints) {
              final double maxBarWidth = constraints.maxWidth;
              final double percentage =
                  (category.maxAmount! - tAmountSpent) / category.maxAmount!;
              double width = percentage * maxBarWidth;
              if (width < 0) width = 0;
              return Stack(
                children: [
                  Container(
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.h),
                        bottomRight: Radius.circular(2.h),
                      ),
                    ),
                  ),
                  Container(
                    height: 3.h,
                    width: width,
                    decoration: BoxDecoration(
                      color: setupColor(percentage),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.h),
                        bottomRight: Radius.circular(2.h),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
