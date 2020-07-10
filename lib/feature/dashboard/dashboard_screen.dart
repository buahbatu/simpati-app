import 'package:flutter/material.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';

class DashboardState {}

class DashboardAction
    extends BaseAction<DashboardScreen, DashboardAction, DashboardState> {
  @override
  Future<DashboardState> initState() async => DashboardState();
}

class DashboardScreen
    extends BaseView<DashboardScreen, DashboardAction, DashboardState> {
  @override
  DashboardAction initAction() => DashboardAction();

  @override
  Widget loadingViewBuilder(BuildContext context) => Container();

  @override
  Widget render(
      BuildContext context, DashboardAction action, DashboardState state) {
    return Scaffold(
      body: Text("daadasdasdafafta"),
    );
  }
}
