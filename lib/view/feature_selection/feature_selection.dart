import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/modules/app_widgets/handling_item_click/implementation.dart';
import 'package:fcis_guide/modules/app_widgets/handling_item_click/sheet_item_builder.dart';
import 'package:fcis_guide/modules/app_widgets/profile_action_button.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/modules/data_types/getDeptData.dart';
import 'package:fcis_guide/view/notes/notes.dart';
import 'package:fcis_guide/view/profile/profile.dart';
import 'package:fcis_guide/view_model/home/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/app_widgets/passing_message.dart';
import '../docs/docs.dart';

class FeatureSelection extends StatelessWidget {
  final String year;
  FeatureSelection({super.key,
    required this.year,
  });

  final List<String> features =
  [
    'Profile',
    'Semesters',
    'Documents',
    'Notes',
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
        actions: const [ProfileActionButton()],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 25.h),
        child: Column(
          children: [
            Expanded(
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
                    switch(index){
                      case 0:
                        context.normalNewRoute(Profile());
                      case 1:
                        showSemesterBottomSheet(context);
                      case 2:
                        context.normalNewRoute(const Docs());
                      case 3:
                        context.normalNewRoute(const Notes());
                    }
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
            PassingMessage(phase: year, yearsNumber: 50),
          ],
        ),
      ),
    );
  }
}
