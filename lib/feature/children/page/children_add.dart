import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/framework/mixin/ticker_action_mixin.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/feature/children/page/add_steps/step_1.dart';
import 'package:simpati/feature/children/page/add_steps/step_3.dart';

import 'add_steps/step_2.dart';

class ChildAddState {}

class ChildAddAction
    extends BaseAction<ChildAddScreen, ChildAddAction, ChildAddState>
    with TickerActionMixin {
  @override
  Future<ChildAddState> initState() async {
    return ChildAddState();
  }
}

class ChildAddScreen
    extends BaseView<ChildAddScreen, ChildAddAction, ChildAddState> {
  @override
  ChildAddAction initAction() {
    return ChildAddAction();
  }

  @override
  Widget loadingViewBuilder(BuildContext context) => Container(
        color: ResColor.appBackground,
        child: Center(
          child: SpinKitChasingDots(
            color: ResColor.primaryColor,
            size: 50.0,
          ),
        ),
      );

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: ResColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: ResColor.appBackground,
    );
  }

  bool isFilled<T>(T value) {
    if (value is String) {
      return value != null && value.isNotEmpty;
    }
    return value != null;
  }

  @override
  Widget render(
      BuildContext context, ChildAddAction action, ChildAddState state) {
    TabController _tabController = new TabController(length: 3, vsync: action);
    return Scaffold(
      backgroundColor: ResColor.appBackground,
      appBar: createAppBar(context),
      body: TabBarView(
        controller: _tabController,
        children: [
          Step1AddChild(onButtonClick: () {
            // if (!isFilled(child.fullName) ||
            //     !isFilled(child.birthDate) ||
            //     !isFilled(child.momName)) {
            //   Scaffold.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text('Isi semua kolom terlebih dulu'),
            //     ),
            //   );
            // } else {
            //   _tabController.animateTo(1);
            // }
          }),
          Step2AddChild(
            onButtonClick: () {
              // if (!isFilled(child.height) ||
              //     !isFilled(child.weight) ||
              //     !isFilled(child.temperature) ||
              //     !isFilled(child.headSize) ||
              //     !isFilled(child.bloodType)) {
              //   Scaffold.of(context).showSnackBar(
              //     SnackBar(
              //       content: Text('Isi semua kolom terlebih dulu'),
              //     ),
              //   );
              // } else {
              //   // bloc.add(AddChildEvent());
              // }
            },
          ),
          Step3AddChild(
            onButtonClick: () {
              // if (!isFilled(child.height) ||
              //     !isFilled(child.weight) ||
              //     !isFilled(child.temperature) ||
              //     !isFilled(child.headSize) ||
              //     !isFilled(child.bloodType)) {
              //   Scaffold.of(context).showSnackBar(
              //     SnackBar(
              //       content: Text('Isi semua kolom terlebih dulu'),
              //     ),
              //   );
              // } else {
              //   // bloc.add(AddChildEvent());
              // }
            },
          ),
        ],
      ),
    );
  }
}
