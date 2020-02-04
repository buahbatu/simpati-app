import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/presentation/pregnancy/fragment/add_steps/step_pregnancy.dart';

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
    return Scaffold(
      backgroundColor: AppColor.appBackground,
      appBar: createAppBar(context),
      body: Step1AddPregnancy(),
    );
  }
}
