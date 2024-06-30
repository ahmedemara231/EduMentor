import 'package:fcis_guide/extensions/context.dart';
import 'package:fcis_guide/modules/base_widgets/myText.dart';
import 'package:fcis_guide/view_model/home/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/home/cubit.dart';

class Docs extends StatefulWidget {
  const Docs({super.key});

  @override
  State<Docs> createState() => _DocsState();
}

class _DocsState extends State<Docs> {

  @override
  void initState() {
    HomeCubit.getInstance(context).getSlate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: 'Documents',color: Colors.white,),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit,HomeStates>(
        builder: (context, state) => state is GetSlateLoading?
        const Center(child: CircularProgressIndicator()) : Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView.separated(
            itemBuilder: (context, index) => SizedBox(
              width: double.infinity,
              height: context.setHeight(2),
              child: Image.network(
                HomeCubit.getInstance(context).urls[index],
                fit: BoxFit.fill,
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemCount: HomeCubit.getInstance(context).urls.length,
          ),
        ),
      ),
    );
  }
}
