import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fcis_guide/model/remote/firebase_service/errors.dart';
import 'package:fcis_guide/model/remote/firebase_service/auth_service/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/src/result.dart';

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

          return Result.success(userCredential);

        } on FirebaseAuthException catch (e) {
          return Result.error(FirebaseAuthenticationException(e.code));
        }
      default:
        return Result.error(NetworkException('Please Check your connection and try again'));
    }
  }
}

