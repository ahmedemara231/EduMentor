import 'package:fcis_guide/model/remote/firebase_service/auth_service/auth_services_implementation.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/modules/base_widgets/textFormField.dart';
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
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit,AuthStates>(
        builder: (context, state) => Scaffold(
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                TFF(
                  obscureText: false,
                  controller: emailCont,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: TFF(
                    obscureText: false,
                    controller: passCont,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
                ElevatedButton(
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
                  },
                  child: MyText(text: 'Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
