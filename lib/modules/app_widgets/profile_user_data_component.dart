import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileData extends StatelessWidget {
  final String? rightHandSideText;
  final String leftHandSideText;
  final Color? textColor;

  const ProfileData({super.key,
    required this.leftHandSideText,
    required this.rightHandSideText,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(
          text: '$leftHandSideText : ',color: Colors.grey,
          fontSize: 14.sp,
        ),
        MyText(
          text: rightHandSideText!,
          fontSize: 14.sp,
          color: textColor??Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
