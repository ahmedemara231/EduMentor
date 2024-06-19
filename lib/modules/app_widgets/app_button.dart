import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base_widgets/myText.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: SizedBox(
          width: context.setWidth(1),
          child: Center(
            child: MyText(
              text: text,
              color: Constants.appColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
