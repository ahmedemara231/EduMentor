import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/modules/data_types/getDeptData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'interface.dart';

class SheetItemBuilder extends StatelessWidget {

  List<String> choosingList;
  DeptDataRequest request;
  HandleTabClick handleTabClick;

  SheetItemBuilder({super.key,
    required this.choosingList,
    required this.request,
    required this.handleTabClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0.h),
            child: MyText(
              text: 'Choose Department',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Constants.appColor,
            ),
          ),
          Column(
            children: List.generate(
              choosingList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => handleTabClick.onClick(
                      context,
                      request: request,
                      choosingList: choosingList,
                      index: index
                  ),
                  child: Container(
                    decoration: Constants.decoration,
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: MyText(
                            text: choosingList[index],
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
