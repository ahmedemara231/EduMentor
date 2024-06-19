import 'package:fcis_guide/modules/data_types/getDeptData.dart';
import 'package:flutter/cupertino.dart';

abstract class HandleTabClick{

  Future<void> onClick(BuildContext context,{
    required DeptDataRequest request,
    required List<String> choosingList,
    required int index,
});

}