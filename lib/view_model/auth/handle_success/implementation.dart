import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/view/auth/login/login.dart';
import 'package:fcis_guide/view_model/auth/handle_success/interface.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../view/home/home.dart';

class HandleLoginSuccess extends HandleSuccess{

  @override
  Future<void> handleSuccess(BuildContext context)async{
    context.removeOldRoute(Home());
  }


}

class HandleSignUpSuccess extends HandleSuccess{
  @override
  Future<void> handleSuccess(BuildContext context) async{
    context.removeOldRoute(Login());
  }
}