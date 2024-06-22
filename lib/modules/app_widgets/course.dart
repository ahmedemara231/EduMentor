import 'package:cached_network_image/cached_network_image.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';

class Course extends StatelessWidget {

  final String englishName;
  final String arabicName;
  const Course({super.key,
    required this.englishName,
    required this.arabicName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 16.sp,
        backgroundImage: const CachedNetworkImageProvider(Constants.defaultBookImage)
      ),
      title: MyText(text: englishName,),
      subtitle: MyText(text: arabicName,),
      trailing: const Icon(Icons.bar_chart_rounded),
    );
  }
}
