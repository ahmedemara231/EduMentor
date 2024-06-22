import 'package:fcis_guide/extensions/routes.dart';
import 'package:fcis_guide/model/local/shared_prefs.dart';
import 'package:fcis_guide/modules/app_widgets/app_button.dart';
import 'package:fcis_guide/modules/base_widgets/toast.dart';
import 'package:fcis_guide/view/year_selection/year_selection.dart';
import 'package:flutter/material.dart';
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
          'Second',
          'Third',
          'Fourth',
        ],
        title: 'Select your current academic year',
    ),

    ExpansionTileWidget(
        choosingList: const [
          'General',
          'Computer Science',
          'Information Technology',
          'Information System',
          'Software Engineering',
          'BIO Informatics',
          'Artificial Intelligence'
        ],
        title: 'Select your Department',
    )
  ];

  int currentPage = 0;

  Future<void> handleLastScreen()async
  {
    List<String> userAcademicData = [
      userRegisteration[0].titleOverride!,
      userRegisteration[1].titleOverride!,
    ];

    CacheHelper.getInstance().setData(
        key: 'userAcademicData',
        value: userAcademicData
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
      ),
    );
  }
}
