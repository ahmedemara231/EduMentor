import 'package:fcis_guide/extensions/context.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpansionTileWidget extends StatefulWidget {

  final String title;
  final List<String> choosingList;

  ExpansionTileWidget({super.key,
    required this.choosingList,
    required this.title,
  });

  String? titleOverride;

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {

  final ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'What\'s your class?',
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        SizedBox(height: 16.h,),
        MyText(
          text: 'Choose which class you are in',
          fontSize: 18.sp,
          color: Colors.white,
        ),


        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                controller: controller,
                expandedAlignment: Alignment.centerLeft,
                backgroundColor: Colors.white,
                title: MyText(
                    text: widget.titleOverride??widget.title,
                    fontSize: 14.sp,
                ),
                children: [
                  SizedBox(
                    height : context.setHeight(2.5),
                    child: ListView(
                      children: List.generate(
                        widget.choosingList.length, (index) => InkWell(
                        onTap: widget.choosingList[index].startsWith('s')?
                        null :()
                        {
                          setState(() {
                            widget.titleOverride = widget.choosingList[index];
                            controller.collapse();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              MyText(
                                text: widget.choosingList[index],
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ),
                    ),
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }
}