import 'package:cached_network_image/cached_network_image.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constants.dart';

enum CourseStatus{passed, fail, waiting}

class Course extends StatelessWidget {

  final String englishName;
  final String arabicName;
  final CourseStatus status;
  final void Function()? onPressed;

  const Course({super.key,
    required this.englishName,
    required this.arabicName,
    required this.status,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 19.sp,
            backgroundColor: status == CourseStatus.passed? Colors.green : Colors.red,
          ),
          CircleAvatar(
            radius: 16.sp,
            backgroundImage: const CachedNetworkImageProvider(Constants.defaultBookImage)
          ),
        ],
      ),
      title: MyText(text: englishName,),
      subtitle: MyText(text: arabicName,),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.bar_chart_rounded)
      ),
    );
  }
}
