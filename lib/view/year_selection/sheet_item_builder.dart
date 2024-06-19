import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetItemBuilder extends StatelessWidget {
  SheetItemBuilder({super.key});

  final Decoration decoration = BoxDecoration(
      color: Constants.appColor,
      borderRadius: BorderRadius.circular(14)
  );

  List<String> depts =
  [
    'CS',
    'IT',
    'IS',
    'SWE',
    'BIO',
    'AI',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0.h),
            child: MyText(
              text: 'Choose your Department',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Constants.appColor,
            ),
          ),
          Column(
            children: List.generate(
              depts.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: decoration,
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: MyText(
                            text: depts[index],
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
