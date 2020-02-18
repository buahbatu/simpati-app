import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/presentation/child/fragment/add_steps/add_steps.dart';

class ChildAddPage extends StatelessWidget {
  final Child initialData;

  const ChildAddPage({Key key, this.initialData}) : super(key: key);

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: AppColor.appBackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.appBackground,
        appBar: createAppBar(context),
        body: TabBarView(
          children: [
            Step1AddChild(),
            Step2AddChild(),
          ],
        ),
      ),
    );
  }
}
