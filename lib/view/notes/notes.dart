import 'package:fcis_guide/modules/base_widgets/divider.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/view/notes/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: 'Notes',color: Colors.white,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 16),
            child: ListView(
              children: List.generate(
                  notesData.length,
                      (index) => Column(
                        children: [
                          MyText(
                            text: '$index - ${notesData[index]}',
                            maxLines: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: const MyDivider(height: 1),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
