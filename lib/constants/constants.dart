import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Constants
{
  // Colors
  static final Color appColor = HexColor('#6B9080');

  //other
  static const String firstSemester = 'firstSemester';
  static const String secondSemester = 'secondSemester';

  //images
  static const String defaultPersonImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQadzeS41vONIfTEWPgkhrALgZ31RSwdba_AA&s';
  static const String defaultBookImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw1VvHQ7ZzfHWdBODYTF64oFMKI_fIVQ-sJg&s';
  static const String appLogo = 'images/app_logo.png';
  static const String appName = 'images/EduMentor.png';


  static final Decoration decoration = BoxDecoration(
      color: Constants.appColor,
      borderRadius: BorderRadius.circular(14)
  );
}