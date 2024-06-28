import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/view/auth/sign_up/user_year_dept_selection.dart';
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
        if(rightHandSideText != 'Set')
          MyText(
          text: rightHandSideText!,
          fontSize: 14.sp,
          color: textColor??Colors.black,
          fontWeight: FontWeight.bold,
        ),
        if(rightHandSideText == 'Set')
          TextButton(
            onPressed: () => context.normalNewRoute(const UserYearDeptSelection()),
             child: MyText(
               text: rightHandSideText!,
               fontSize: 14.sp,
               color: Constants.appColor,
               fontWeight: FontWeight.bold,
             ),
          ),
      ],
    );
  }
}
