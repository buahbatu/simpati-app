import 'package:flutter/material.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';

class ChildrenState {}

class ChildrenAction
    extends BaseAction<ChildrenScreen, ChildrenAction, ChildrenState> {
  @override
  Future<ChildrenState> initState() async => ChildrenState();
}

class ChildrenScreen
    extends BaseView<ChildrenScreen, ChildrenAction, ChildrenState> {
  @override
  ChildrenAction initAction() => ChildrenAction();

  @override
  Widget loadingViewBuilder(BuildContext context) => Container();

  @override
  Widget render(
      BuildContext context, ChildrenAction action, ChildrenState state) {
    return Scaffold(
      body: Text("Children"),
    );
  }
}
