import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/presentation/mother/fragment/add_steps/add_steps.dart';

class PregnancyAddPage extends StatelessWidget {
  final Mother motherData;

  const PregnancyAddPage(this.motherData, {Key key}) : super(key: key);

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
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.appBackground,
        appBar: createAppBar(context),
        body: TabBarView(
          children: [
            Step1AddMother(),
            Step2AddMother(),
            Step3AddMother(),
          ],
        ),
      ),
    );
  }
}
