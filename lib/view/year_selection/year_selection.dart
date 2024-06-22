import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/modules/app_widgets/passing_message.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/modules/app_widgets/handling_item_click/sheet_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../modules/app_widgets/handling_item_click/implementation.dart';
import '../../modules/app_widgets/profile_action_button.dart';
import '../../modules/data_types/getDeptData.dart';

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

  Future<void> showSheet(context,{
    required DeptDataRequest request,
    required List<String> choosingList
  })async
  {
    showModalBottomSheet(
      context: context,
      builder: (context) => SheetItemBuilder(
        handleTabClick: HandleDeptClick(),
        request: request,
        choosingList: choosingList
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
          text: 'Academic year',
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
                    switch(index)
                    {
                      case 2:
                      case 3:
                        showSheet(
                          context,
                          request: DeptDataRequest(
                            year: '${academicYear[index].toLowerCase()}Year',
                            yearCode: index + 1,
                          ),
                          choosingList: const [
                            'CS',
                            'IT',
                            'IS',
                            'SWE',
                            'BIO',
                            'AI',
                          ],
                        );

                      default:
                        showSheet(
                          context,
                          request: DeptDataRequest(
                            year: '${academicYear[index].toLowerCase()}Year',
                            yearCode: index + 1,
                          ),
                          choosingList: const [
                            'SWE',
                            'BIO',
                            'AI',
                            'General'
                          ],
                        );
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
            const PassingMessage(phase: '4 years',yearsNumber: 100),
          ],
        ),
      ),
    );
  }
}
