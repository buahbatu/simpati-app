import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/network/network.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/storage/app_config.dart';
import 'package:simpati/core/view/fade_indexed_stack.dart';
import 'package:simpati/feature/article/article_screen.dart';
import 'package:simpati/feature/children/children_screen.dart';
import 'package:simpati/feature/dashboard/dashboard_screen.dart';
import 'package:simpati/feature/home/login/login_dialog.dart';
import 'package:simpati/feature/mother/mother_screen.dart';

class HomeState {
  int selectedIndex = 0;
  bool isLoggedIn = false;

  HomeState({this.isLoggedIn});

  Map<BaseView, BottomNavyBarItem> createItems() {
    return {
      DashboardScreen(): BottomNavyBarItem(
        icon: Icon(LineAwesomeIcons.home),
        title: Text('Beranda'),
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
      ),
      MotherScreen(): BottomNavyBarItem(
        icon: Icon(LineAwesomeIcons.female),
        title: Text('Ibu'),
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
      ),
      ChildrenScreen(): BottomNavyBarItem(
        icon: Icon(LineAwesomeIcons.child),
        title: Text('Anak'),
        activeColor: Colors.pink,
        inactiveColor: Colors.grey,
      ),
      ArticleScreen(): BottomNavyBarItem(
        icon: Icon(LineAwesomeIcons.book),
        title: Text('Artikel'),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
    };
  }
}

class HomeAction extends BaseAction<HomeScreen, HomeAction, HomeState> {
  @override
  Future<HomeState> initState() async {
    final token = AppConfig.token.val.accessToken;
    bool loggedIn;
    if (token.isNotEmpty) {
      loggedIn = true;
    } else {
      await navigateToLogin();
    }
    return HomeState(isLoggedIn: loggedIn);
  }

  void onItemSelected() {
    return null;
  }

  void changeTab(int idx) {
    state.selectedIndex = idx;
    render();
  }

  void navigateToLogin() async {
    await Get.to(LoginScreen());
  }
}

class HomeScreen extends BaseView<HomeScreen, HomeAction, HomeState> {
  @override
  HomeAction initAction() => HomeAction();

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

  @override
  Widget render(BuildContext context, HomeAction action, HomeState state) {
    final items = state.createItems();

    return Scaffold(
        body: SafeArea(
            child: FadeIndexedStack(
          index: state.selectedIndex,
          children: items.keys.toList(),
          duration: const Duration(milliseconds: 300),
        )),
        bottomNavigationBar:
            createNavBar(state, action, items.values.toList()));
  }

  BottomNavyBar createNavBar(
      HomeState state, HomeAction action, List<BottomNavyBarItem> items) {
    return BottomNavyBar(
      showElevation: true,
      items: items,
      selectedIndex: state.selectedIndex,
      onItemSelected: (index) => action.changeTab(index),
    );
  }
}
