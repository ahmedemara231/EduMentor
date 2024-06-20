import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/view_model/home/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Semesters extends StatelessWidget {
  const Semesters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: 'Semesters',
          color:Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25.sp,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyText(
                      text: HomeCubit.getInstance(context).academicYearInfo.year,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey,
                    ),
                  ),
                  MyText(
                      text: HomeCubit.getInstance(context).academicYearInfo.title,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
