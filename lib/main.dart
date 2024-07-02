import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/view/auth/first_view.dart';
import 'package:fcis_guide/view/auth/login/login.dart';
import 'package:fcis_guide/view/auth/sign_up/user_year_dept_selection.dart';
import 'package:fcis_guide/view/feature_selection/feature_selection.dart';
import 'package:fcis_guide/view/splash.dart';
import 'package:fcis_guide/view/year_selection/year_selection.dart';
import 'package:fcis_guide/view_model/auth/cubit.dart';
import 'package:fcis_guide/view_model/bloc_observer.dart';
import 'package:fcis_guide/view_model/home/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'model/local/secure_storage.dart';
import 'model/local/shared_prefs.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.getInstance().cacheInit();
  SecureStorage.getInstance().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Constants.appColor,
            appBarTheme: AppBarTheme(
              color: Constants.appColor,
            )
          ),
          debugShowCheckedModeBanner: false,
          home: const Splash(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}