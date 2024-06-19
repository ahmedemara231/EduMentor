import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/model/remote/firebase_service/auth_service/auth_services_implementation.dart';
import 'package:fcis_guide/view/auth/login/login.dart';
import 'package:fcis_guide/view_model/auth/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../modules/app_widgets/Auth_TFF.dart';
import '../../../modules/app_widgets/app_button.dart';
import '../../../modules/base_widgets/myText.dart';
import '../../../view_model/auth/cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailCont = TextEditingController();

  final passCont = TextEditingController();
  final confirmPassCont = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late List<Widget> signUpInputs;

  @override
  void initState() {
    signUpInputs =
    [
      AuthTFF(
        text: 'email',
        cont: emailCont,
      ),
      BlocBuilder<AuthCubit,AuthStates>(
        builder: (context, state) => AuthTFF(
          text: 'password',
          cont: passCont,
          invisiblePass: AuthCubit.getInstance(context).invisiblePass[1],
          suffixIcon: IconButton(
            onPressed: () {
              AuthCubit.getInstance(context).changePassVisibility(1);
            },
            icon: AuthCubit.getInstance(context).invisiblePass[1]?
            const Icon(Icons.visibility_off) :
            const Icon(Icons.visibility),
          ),
        ),
      ),
      BlocBuilder<AuthCubit,AuthStates>(
        builder: (context, state) => AuthTFF(
          text: 'password',
          cont: passCont,
          invisiblePass: AuthCubit.getInstance(context).invisiblePass[2],
          suffixIcon: IconButton(
            onPressed: () {
              AuthCubit.getInstance(context).changePassVisibility(2);
            },
            icon: AuthCubit.getInstance(context).invisiblePass[2]?
            const Icon(Icons.visibility_off) :
            const Icon(Icons.visibility),
          ),
        ),
      ),
    ];
    super.initState();
  }
  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    confirmPassCont.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: MyText(
                text: 'Create an account',
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: List.generate(
                    signUpInputs.length,(index) => signUpInputs[index]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: AppButton(
                onPressed: () {
                  if(formKey.currentState!.validate())
                  {
                    AuthCubit.getInstance(context).auth(
                        context,
                        authService: FirebaseRegisterCall(),
                        email: emailCont.text,
                        password: passCont.text
                    );
                  }
                } ,
                text: 'Sign up',
              ),
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
                  onPressed: () => context.removeOldRoute(Login()),
                  child: MyText(
                    text: 'Login',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
