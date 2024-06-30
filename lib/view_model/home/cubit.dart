import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/model/remote/firebase_service/firestore_service/firestore_services.dart';
import 'package:fcis_guide/model/remote/firebase_service/storage_service/implementation.dart';
import 'package:fcis_guide/model/remote/firebase_service/storage_service/interface.dart';
import 'package:fcis_guide/modules/data_types/academic_year_info.dart';
import 'package:fcis_guide/modules/data_types/getDeptData.dart';
import 'package:fcis_guide/modules/data_types/subject.dart';
import 'package:fcis_guide/view_model/home/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  factory HomeCubit.getInstance(context) => BlocProvider.of(context);

  DeptDataRequest? request;

  late DocumentReference documentReference;
  late AcademicYearInfo academicYearInfo;

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
          await value.getOrThrow().get().then((value) {
            academicYearInfo = AcademicYearInfo.fromJson(value.docs[0].data() as Map<String, dynamic>);
          });

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

  int currentSemester = 0;
  void switchSemester(int newVal)
  {
    currentSemester = newVal;
    emit(SwitchSemester());
  }


  List<String> semesters = [Constants.firstSemester,Constants.secondSemester];
  Map<String,List<Subject>> semesterSubjects = {};

  Future<void> getSemesterData()async
  {
    emit(GetSemesterDataLoading());

    for(String semester in semesters)
      {
        semesterSubjects[semester] = [];
        var result = await documentReference.collection(semester).get();

        result.docs.forEach((element) {
          semesterSubjects[semester]?.add(Subject.fromJson(element.data()));
        });
        emit(GetSemesterDataSuccess());
      }
  }

  late List<Subject> resultingFromCourses;
  Future<void> getResultingFromCourses(List resultingFrom)async
  {
    resultingFromCourses = [];
    emit(GetResultingFromCoursesLoading());


    resultingFrom.forEach((element) {
      element.get().then((value) {
        resultingFromCourses.add(Subject.fromJson(value.data()));
      });
    });

    emit(GetResultingFromCoursesSuccess());
  }

  FireStorageService fireStorageService = FireStorageCall();
  late List<String> urls;
  Future<void> getSlate()async
  {
    urls = [];
    emit(GetSlateLoading());
    final result = await fireStorageService.callFireStorage();
    urls = result.getOrThrow();
    emit(GetSlateSuccess());
  }

}
