import 'package:multiple_result/multiple_result.dart';
import '../errors.dart';

abstract class FireStorageService
{
  Future<Result<List<String>,FirebaseError>> callFireStorage();
}