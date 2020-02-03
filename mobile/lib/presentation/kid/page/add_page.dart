import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/domain/entity/Kid.dart';
import 'package:simpati/presentation/Kid/fragment/add_steps/add_steps.dart';

class KidAddPage extends StatelessWidget {
  final Kid initialData;

  const KidAddPage({Key key, this.initialData}) : super(key: key);

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
            Step1AddKid(),
            Step2AddKid(),
          ],
        ),
      ),
    );
  }
}
