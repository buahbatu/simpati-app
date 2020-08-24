import 'package:flutter/material.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/res_strings.dart';

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

  Widget createAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        children: [Text(ResString.TITLE_BERANDA)],
      ),
    );
  }

  @override
  Widget render(
      BuildContext context, DashboardAction action, DashboardState state) {
    return Scaffold(
      appBar: createAppBar(),
      body: Text(""),
    );
  }
}
