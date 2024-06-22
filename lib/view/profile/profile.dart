import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/model/local/shared_prefs.dart';
import 'package:fcis_guide/modules/app_widgets/profile_user_data_component.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final profileData = 
  const [
    ProfileData(rightHandSideText: 'Faculty', leftHandSideText: 'Computer and information'),
    ProfileData(rightHandSideText: 'Program', leftHandSideText: 'Software Engineering'),
    ProfileData(rightHandSideText: 'Status', leftHandSideText: 'Regular'),
    ProfileData(rightHandSideText: 'Level', leftHandSideText: '4'),

  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: 'Profile',
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 25.sp,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 55.sp,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQadzeS41vONIfTEWPgkhrALgZ31RSwdba_AA&s'),
              ),
            ),
            SizedBox(height: 20.sp,),
            MyText(
                text: CacheHelper.getInstance().getUserData()![1],
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
                color: Colors.white
            ),
            MyText(
              text: 'ID : ${CacheHelper.getInstance().getUserData()![0]}',
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20.sp,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        profileData.length, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: profileData[index],
                    )),
                  ),
                ),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}