import 'package:fcis_guide/constants/constants.dart';
import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/model/local/shared_prefs.dart';
import 'package:fcis_guide/modules/app_widgets/app_button.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/modules/base_widgets/toast.dart';
import 'package:fcis_guide/view/year_selection/year_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../modules/app_widgets/expansionTileWidget.dart';

class UserYearDeptSelection extends StatefulWidget {
  const UserYearDeptSelection({super.key});

  @override
  State<UserYearDeptSelection> createState() => _UserYearDeptSelectionState();
}

class _UserYearDeptSelectionState extends State<UserYearDeptSelection> {
  final PageController controller = PageController();

  final List<ExpansionTileWidget> userRegisteration =
  [
    ExpansionTileWidget(
        choosingList:
        const [
          'First',
          'summer 1',
          'Second',
          'summer 2',
          'Third',
          'summer 3',
          'Fourth',
          'summer 4'
        ],
        title: 'Select your current academic year',
    ),

    ExpansionTileWidget(
        choosingList: const [
          'Software Engineering',
          'BIO Informatics',
          'Artificial Intelligence'
        ],
        title: 'Select your Department',
    ),

    ExpansionTileWidget(
      choosingList:
      const [
        'First',
        'Second',
      ],
      title: 'Select your Semester',
    ),
  ];

  int currentPage = 0;

  Future<void> handleLastScreen()async
  {
    List<String> userAcademicData = [
      userRegisteration[0].titleOverride!,
      userRegisteration[1].titleOverride!,
      userRegisteration[2].titleOverride!,
    ];

    CacheHelper.getInstance().setData(
        key: 'userAcademicData',
        value: userAcademicData
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () => context.removeOldRoute(YearSelection()), 
              child: MyText(text: 'Skip',fontSize: 14.sp,fontWeight: FontWeight.w500,color: Constants.appColor,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) => userRegisteration[index],
                itemCount: userRegisteration.length,
                onPageChanged: (newPage)
                {
                  setState(() {
                    currentPage = newPage;
                  });
                },
              ),
            ),
            AppButton(
                onPressed: ()
                {
                  if(userRegisteration[currentPage].titleOverride == null)
                  {
                    MyToast.showToast(
                      context,
                      msg: 'Please select an option',
                      color: Colors.red,
                    );
                  }
                  else{
                    if(currentPage == userRegisteration.length - 1)
                    {
                      handleLastScreen().whenComplete(() =>
                          context.removeOldRoute(YearSelection())
                      );
                    }else{
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.bounceIn
                      );
                    }
                  }
                  }, text: 'Next'
            )
          ],
        ),
      ),
    );
  }
}
