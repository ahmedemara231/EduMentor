import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/model/local/shared_prefs.dart';
import 'package:fcis_guide/model/remote/firebase_service/errors.dart';
import 'package:fcis_guide/model/remote/firebase_service/auth_service/auth_services.dart';
import 'package:fcis_guide/modules/base_widgets/toast.dart';
import 'package:fcis_guide/view/auth/login/login.dart';
import 'package:fcis_guide/view/year_selection/year_selection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiple_result/src/result.dart';

import '../../../../view/auth/sign_up/user_year_dept_selection.dart';

class FirebaseRegisterCall extends FirebaseAuthService
{
  @override
  Future<Result<UserCredential, FirebaseError>> callFirebaseAuth({
    required String email,
    required String password,
  })async{

    final connectivityResult = await Connectivity().checkConnectivity();

    switch(connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.vpn:
        try{
         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
             email: email,
             password: password
         );

         return Result.success(userCredential);

        } on FirebaseAuthException catch (e) {
          return Result.error(FirebaseAuthenticationException(e.code));
        }
      default:
        return Result.error(NetworkException('Please Check your connection and try again'));
    }
  }

  @override
  void handleSuccess(BuildContext context) {
    context.removeOldRoute(const UserYearDeptSelection());

  }

  @override
  void handleError(context, String? errorMessage) {
    MyToast.showToast(context, msg: errorMessage!,color: Colors.red);
  }

}

class FirebaseLoginCall extends FirebaseAuthService
{
  @override
  Future<Result<UserCredential, FirebaseError>> callFirebaseAuth({
    required String email,
    required String password,
  })async{

    final connectivityResult = await Connectivity().checkConnectivity();

    switch(connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.vpn:
        try{
          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,
              password: password
          );

          cacheData(userCredential);

          return Result.success(userCredential);

        } on FirebaseAuthException catch (e) {
          return Result.error(FirebaseAuthenticationException(e.code));
        }
      default:
        return Result.error(NetworkException('Please Check your connection and try again'));
    }
  }

  void cacheData(UserCredential userCredential)async
  {
    await CacheHelper.getInstance().setData(
      key: 'userData',
      value:
      [
        '${userCredential.user?.uid}',
        '${userCredential.user?.email!}',
      ],
    );
  }

  @override
  void handleSuccess(BuildContext context) {
    context.removeOldRoute(YearSelection());
  }

  @override
  void handleError(context, String? errorMessage) {
    MyToast.showToast(context, msg: errorMessage!,color: Colors.red);
  }
}

