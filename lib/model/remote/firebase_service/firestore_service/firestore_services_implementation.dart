import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:multiple_result/multiple_result.dart';
import '../errors.dart';
import 'firestore_services.dart';

class FirebaseStoreCall extends FireStoreService
{
  @override
  Future<Result<CollectionReference<Object?>, FirebaseError>> callFireStore(String collectionName)async
  {
    final connectivityResult = await Connectivity().checkConnectivity();
    switch(connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.vpn:
        try{
          CollectionReference collection = FirebaseFirestore.instance.collection(collectionName);

          return Result.success(collection);

        } on FirebaseException catch (e) {
          return Result.error(FirebaseStoreException(e.code));
        }
      default:
        return Result.error(NetworkException('Please Check your connection and try again'));
    }
  }
}