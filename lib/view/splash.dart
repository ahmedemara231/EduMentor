import 'dart:async';

import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/model/local/shared_prefs.dart';
import 'package:fcis_guide/view/auth/login/login.dart';
import 'package:fcis_guide/view/year_selection/year_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Timer(
        const Duration(seconds: 2), () {
          if(CacheHelper.getInstance().getUserData() == null)
            {
              context.removeOldRoute(Login());
            }
          else{
            context.removeOldRoute(YearSelection());
          }
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values
    );
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 120.w,
                height: 120.h,
                child: Image.asset(Constants.appLogo),
            ),

            SizedBox(
              width: 200.w,
              height: 200.h,
              child: Image.asset(Constants.appName),
            ),

            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
