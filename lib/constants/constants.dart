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

  static final Decoration decoration = BoxDecoration(
      color: Constants.appColor,
      borderRadius: BorderRadius.circular(14)
  );
}