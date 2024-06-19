import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/model/remote/firebase_service/auth_service/auth_services_implementation.dart';
import 'package:fcis_guide/modules/app_widgets/Auth_TFF.dart';
import 'package:fcis_guide/modules/app_widgets/app_button.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/view/auth/sign_up/sign_up.dart';
import 'package:fcis_guide/view_model/auth/cubit.dart';
import 'package:fcis_guide/view_model/auth/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final emailCont = TextEditingController();
  final passCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthStates>(
      builder: (context, state) => Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: MyText(
                    text: 'Login',
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                AuthTFF(
                  text: 'email',
                  cont: emailCont,
                ),
                AuthTFF(
                  text: 'password',
                  cont: passCont,
                  invisiblePass: AuthCubit.getInstance(context).invisiblePass[0],
                  suffixIcon: IconButton(
                    onPressed: () {
                      AuthCubit.getInstance(context).changePassVisibility(0);
                    },
                    icon: AuthCubit.getInstance(context).invisiblePass[0]?
                    const Icon(Icons.visibility_off) :
                    const Icon(Icons.visibility),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 5.h,bottom: 12.h),
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      MyText(text: 'Remember Me'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: MyText(text: 'Forgot Password?',color: Colors.black),
                      )
                    ],
                  ),
                ),

                AppButton(
                  onPressed: () {
                    if(formKey.currentState!.validate())
                      {
                        AuthCubit.getInstance(context).auth(
                            context,
                            authService: FirebaseLoginCall(),
                            email: emailCont.text,
                            password: passCont.text
                        );
                      }
                  } ,
                  text: 'Login',
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: 'Already have an account?',
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                    TextButton(
                      onPressed: () => context.normalNewRoute(const SignUp()),
                      child: MyText(
                        text: 'Sign up',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
