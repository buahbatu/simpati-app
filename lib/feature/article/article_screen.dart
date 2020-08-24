import 'package:flutter/material.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/res_strings.dart';

class ArticleState {}

class ArticleAction
    extends BaseAction<ArticleScreen, ArticleAction, ArticleState> {
  @override
  Future<ArticleState> initState() async => ArticleState();
}

class ArticleScreen
    extends BaseView<ArticleScreen, ArticleAction, ArticleState> {
  @override
  ArticleAction initAction() => ArticleAction();

  @override
  Widget loadingViewBuilder(BuildContext context) => Container();

  Widget createAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        children: [Text(ResString.TITLE_ARTICLE)],
      ),
    );
  }

  @override
  Widget render(
      BuildContext context, ArticleAction action, ArticleState state) {
    return Scaffold(
      appBar: createAppBar(),
      body: Text(""),
    );
  }
}
