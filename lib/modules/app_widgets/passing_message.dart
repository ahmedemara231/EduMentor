import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../base_widgets/myText.dart';

class PassingMessage extends StatelessWidget {

  final int yearsNumber;
  final String phase;

  const PassingMessage({super.key,
    required this.phase,
    required this.yearsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning_amber_sharp,color: Colors.black,),
          SizedBox(width: 5.w),
          Expanded(
            child: MyText(
              text: 'To pass $phase , you must complete $yearsNumber hours',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
