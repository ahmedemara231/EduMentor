import 'package:cached_network_image/cached_network_image.dart';
import 'package:fcis_guide/modules/base_widgets/divider.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constants.dart';

enum CourseStatus{passed, fail, waiting}

class Course extends StatelessWidget {

  final String englishName;
  final String arabicName;
  final Color? color;
  final int? courseHours;
  final CourseStatus status;
  final void Function()? onPressed;
  final List<Widget>? resultingFromNames;

  const Course({super.key,
    required this.englishName,
    required this.arabicName,
    this.color,
    this.courseHours,
    required this.status,
    this.onPressed,
    this.resultingFromNames,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: status == CourseStatus.passed?
            Colors.green : status == CourseStatus.waiting? Colors.grey : Colors.red
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 10.sp,
                  child: MyText(
                    text: courseHours.toString(),
                    color: Colors.white,
                  ),
              ),
            ),
            MyText(text: englishName,color: color,),
            MyText(text: arabicName,color: color,),
            // ListTile(
            //   leading: CircleAvatar(
            //     radius: 16.sp,
            //     backgroundImage: const CachedNetworkImageProvider(Constants.defaultBookImage)
            //   ),
            //   title:
            //   subtitle:
            //   trailing: IconButton(
            //       onPressed: onPressed,
            //       icon: const Icon(Icons.bar_chart_rounded)
            //   ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 5.h),
              child: const MyDivider(height: 1.5),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  resultingFromNames!.length,
                      (index) =>  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 10.sp,
                          child: MyText(
                            text: 2.toString(),
                            color: Colors.white,
                          ),
                        ),
                      ),
              )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: resultingFromNames!,
            )
          ],
        ),
      ),
    );
  }
}
