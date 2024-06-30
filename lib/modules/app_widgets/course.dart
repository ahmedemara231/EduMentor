import 'package:cached_network_image/cached_network_image.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constants.dart';

enum CourseStatus{passed, fail, waiting}

class Course extends StatelessWidget {

  final String englishName;
  final String arabicName;
  final Color? color;
  final CourseStatus status;
  final void Function()? onPressed;
  final List<Widget>? resultingFromNames;

  const Course({super.key,
    required this.englishName,
    required this.arabicName,
    this.color,
    required this.status,
    this.onPressed,
    this.resultingFromNames,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: status == CourseStatus.passed?
            Colors.green : status == CourseStatus.waiting? Colors.grey : Colors.red
        )
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 16.sp,
              backgroundImage: const CachedNetworkImageProvider(Constants.defaultBookImage)
            ),
            title: MyText(text: englishName,color: color,),
            subtitle: MyText(text: arabicName,color: color,),
            trailing: IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.bar_chart_rounded)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: resultingFromNames!,
          )
        ],
      ),
    );
  }
}
