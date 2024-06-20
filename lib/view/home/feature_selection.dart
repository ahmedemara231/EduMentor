import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/modules/app_widgets/handling_item_click/implementation.dart';
import 'package:fcis_guide/modules/app_widgets/sheet_item_builder.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/modules/data_types/getDeptData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<String> features =
  [
    'Profile',
    'Semesters',
    'Exams',
    'E-Learning',
    'Documents'
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> semesters = [Constants.firstSemester,Constants.secondSemester];

  void showSemesterBottomSheet(context)
  {
    showModalBottomSheet(
        context: context,
        builder: (context) => SheetItemBuilder(
            choosingList: semesters,
            request: DeptDataRequest(),
            handleTabClick: HandleSemesterClick()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: MyText(
          text: 'Features',
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
              showSemesterBottomSheet(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: MyText(
                  text: features[index],
                  color: Constants.appColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                ),
              ),
            ),
          ),
          itemCount: features.length,
        ),
      ),
    );
  }
}
