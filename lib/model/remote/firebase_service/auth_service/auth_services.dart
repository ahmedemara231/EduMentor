import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcis_guide/model/remote/firebase_service/errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class FirebaseAuthService
{
  Future<Result<UserCredential,FirebaseError>> callFirebaseAuth({
    required String email,
    required String password,
  });
}

