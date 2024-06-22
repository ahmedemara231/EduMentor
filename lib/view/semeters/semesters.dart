import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/extensions/context.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/view/semeters/shimmer_effect.dart';
import 'package:fcis_guide/view_model/home/cubit.dart';
import 'package:fcis_guide/view_model/home/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../modules/app_widgets/course.dart';
import '../../../modules/app_widgets/profile_action_button.dart';

class Semesters extends StatefulWidget {

  int selectedIndex;

  Semesters({super.key,
    required this.selectedIndex,
  });

  @override
  State<Semesters> createState() => _SemestersState();
}

class _SemestersState extends State<Semesters> {
  final List<String> semesters = [Constants.firstSemester,Constants.secondSemester];

  @override
  void initState() {
    HomeCubit.getInstance(context).currentSemester = widget.selectedIndex;
    super.initState();
  }
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
        actions: const [ProfileActionButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
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
            ),


            SizedBox(height: 50.h),


            BlocBuilder<HomeCubit,HomeStates>(
              builder: (context, state) => Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 53.h),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                          color: Colors.white
                      ),
                      child:
                      state is GetSemesterDataLoading?
                      const CoursesShimmerEffect() :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                            child: MyText(text: 'Courses',color: Constants.appColor,fontSize: 16.sp,),
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Course(
                                  englishName: HomeCubit.getInstance(context).semesterSubjects[HomeCubit.getInstance(context).semesters[HomeCubit.getInstance(context).currentSemester]]![index].name,
                                  arabicName: HomeCubit.getInstance(context).semesterSubjects[HomeCubit.getInstance(context).semesters[HomeCubit.getInstance(context).currentSemester]]![index].name
                              ),
                              separatorBuilder: (context, index) => SizedBox(height: 8.h,),
                              itemCount:  HomeCubit.getInstance(context).semesterSubjects[HomeCubit.getInstance(context).semesters[HomeCubit.getInstance(context).currentSemester]]!.length
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          semesters.length, (index) => InkWell(
                        onTap: () => HomeCubit.getInstance(context).switchSemester(index),
                        child: Card(
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10)
                              ),
                              color: HomeCubit.getInstance(context).currentSemester == index?
                              Colors.white :
                              Constants.appColor
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.setWidth(13),
                                    vertical: 15.h
                                ),
                                child: MyText(
                                    text: semesters[index],
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
