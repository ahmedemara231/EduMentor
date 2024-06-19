import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/view/home/home.dart';
import 'package:fcis_guide/view/year_selection/sheet_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearSelection extends StatelessWidget {
  YearSelection({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> academicYear =
  [
    'First',
    'Second',
    'Third',
    'Fourth',
  ];

  Future<void> showSheet(context)async
  {
    // scaffoldKey.currentState!.showBottomSheet(
    //   (context) => Container(),
    // );
    showModalBottomSheet(
      context: context,
      builder: (context) => SheetItemBuilder()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constants.appColor,
        title: MyText(
          text: 'Academic year',
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 25.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 30.h,
              childAspectRatio: 1.2
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: ()
            {
              switch(index)
              {
                case 2:
                case 3:
                  showSheet(context);

                default:
                  context.normalNewRoute(Home());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: MyText(
                  text: academicYear[index],
                  color: Constants.appColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                ),
              ),
            ),
          ),
          itemCount: academicYear.length,
        ),
      ),
    );
  }
}
