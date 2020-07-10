import 'package:flutter/material.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';

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

  @override
  Widget render(
      BuildContext context, ArticleAction action, ArticleState state) {
    return Scaffold(
      body: Text("Article"),
    );
  }
}
