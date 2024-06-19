import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcis_guide/model/remote/firebase_service/firestore_service/firestore_services.dart';
import 'package:fcis_guide/modules/data_types/getDeptData.dart';
import 'package:fcis_guide/view_model/home/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  factory HomeCubit.getInstance(context) => BlocProvider.of(context);

  DeptDataRequest? request;


  late DocumentReference documentReference;
  Future<void> getAcademicYearData(BuildContext context,{
    required FireStoreService service,
    required String academicYear,
})async
  {
    emit(GetDataFromSpecificYearLoading());
    EasyLoading.show(
        status: 'loading...'

    );

    await service.callFireStore(academicYear).then((value)async
    {
      if(value.isSuccess())
        {
          documentReference = await handleGetDataSuccess(
            collection: value.getOrThrow(),
          );

          EasyLoading.dismiss();
          emit(GetDataFromSpecificYearSuccess());
        }
      else{
        emit(
            GetDataFromSpecificYearError(
                value.tryGetError()?.message
            )
        );
      }
    });
  }

  Future<DocumentReference> handleGetDataSuccess({
    required CollectionReference collection,
  })async
  {
    return collection
        .doc(request?.yearCode.toString())
        .collection(request!.dept!)
        .doc(request?.deptCode.toString());
  }

  Future<void> getSemesterData(String semester)async
  {
    var result = await documentReference.collection(semester).get();
    result.docs.forEach((element) {
      print(element.data());
    });
  }


}
