import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/modules/app_widgets/app_button.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/view/auth/login/login.dart';
import 'package:fcis_guide/view/auth/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constants.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 120.h,
                width: 120.w,
                child: Image.asset(Constants.appLogo),
              ),
            ),
            AppButton(
              onPressed: () => context.removeOldRoute(Login()),
              text: 'Login',
            ),
            SizedBox(height: 20.h),
            AppButton(
              onPressed: () => context.removeOldRoute(const SignUp()),
              text: 'Sign up',
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: MyText(
                text: 'Continue as guest',
                textDecoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
