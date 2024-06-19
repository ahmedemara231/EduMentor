import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base_widgets/textFormField.dart';

class AuthTFF extends StatelessWidget {

  final String text;
  final cont;
  bool invisiblePass;
  Widget? suffixIcon;

  AuthTFF({super.key,
    required this.text,
    required this.cont,
    this.invisiblePass = false,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: MyText(text: text,fontSize: 16.sp,color: Colors.white),
        ),
        TFF(
          fillColor: Colors.white,
          filled: true,
          obscureText: invisiblePass,
          controller: cont,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}
