import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseNote extends StatelessWidget {
  const CourseNote({super.key,
    required this.circleColor,
    required this.des,
  });

  final Color circleColor;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5.sp,
          backgroundColor: circleColor,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: MyText(
                text: des,
                maxLines: 3,
                color: Colors.white,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }
}
