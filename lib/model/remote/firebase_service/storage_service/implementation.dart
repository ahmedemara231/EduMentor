import 'package:fcis_guide/model/remote/firebase_service/errors.dart';
import 'package:fcis_guide/model/remote/firebase_service/storage_service/interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multiple_result/src/result.dart';

class FireStorageCall extends FireStorageService
{
  @override
  Future<Result<List<String>, FirebaseError>> callFireStorage()async {
    Reference folderRef = FirebaseStorage.instance.ref().child('fcis slate/');
    List<String> urls = await getUrls(folderRef);
    return Result.success(urls);
  }

  Future<List<String>> getUrls(Reference folderRef)async
  {
    final result = await folderRef.listAll();
    List<String> urls = [];

    for(var item in result.items)
      {
        String url = await item.getDownloadURL();
        urls.add(url);
      }

    return urls;
  }
}