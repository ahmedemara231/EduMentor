import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../modules/app_widgets/course.dart';

class CoursesShimmerEffect extends StatelessWidget {
  const CoursesShimmerEffect({super.key});
  final List<Course> courses =
  const [
    Course(englishName: 'Introduction to computer science', arabicName: 'مقدمة علوم الحاسب',status: CourseStatus.passed),
    Course(englishName: 'Introduction to computer science', arabicName: 'مقدمة علوم الحاسب',status: CourseStatus.passed),
    Course(englishName: 'Introduction to computer science', arabicName: 'مقدمة علوم الحاسب',status: CourseStatus.passed),
    Course(englishName: 'Introduction to computer science', arabicName: 'مقدمة علوم الحاسب',status: CourseStatus.passed),
    Course(englishName: 'Introduction to computer science', arabicName: 'مقدمة علوم الحاسب',status: CourseStatus.passed),
  ];
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => const Course(
            status: CourseStatus.passed,
            englishName: 'Name',
            arabicName:  'Name',
          ),
          separatorBuilder: (context, index) => SizedBox(height: 8.h,),
          itemCount: 3
      ),
    );
  }
}
