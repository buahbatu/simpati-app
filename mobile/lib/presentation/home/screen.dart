import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/presentation/dashboard/fragment.dart';
import 'package:simpati/presentation/home/bloc.dart';
import 'package:simpati/presentation/home/fragment.dart';

class HomeScreen extends StatelessWidget {
  final List<BaseHomeFragment> fragments = <BaseHomeFragment>[
    DashboardFragment(0),
    // WalletFragment(1),
    // BudgetFragment(2),
    // NewsFragment(3),
    DrawerFragmentHelper(4),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenBloc(),
      child: Scaffold(
        backgroundColor: AppColor.appBackground,
        endDrawer: Drawer(),
        body: createBody(),
        bottomNavigationBar: createBottomBar(),
      ),
    );
  }

  Widget createBody() {
    return BlocBuilder<HomeScreenBloc, int>(
      builder: (context, index) => fragments[index].view,
    );
  }

  BlocBuilder<HomeScreenBloc, int> createBottomBar() {
    return BlocBuilder<HomeScreenBloc, int>(builder: (context, index) {
      return BottomNavyBar(
        selectedIndex: index,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => fragments[index].onTabSelected(context),
        items: fragments.map((f) => f.bottomNavyBarItem).toList(),
      );
    });
  }
}

class DrawerFragmentHelper implements BaseHomeFragment {
  DrawerFragmentHelper(this.position);

  @override
  BottomNavyBarItem bottomNavyBarItem = BottomNavyBarItem(
    icon: Icon(LineIcons.bars, color: AppColor.primaryColor),
    title: Text('Lainnya'),
  );

  @override
  Widget view = Container();

  @override
  void onTabSelected(BuildContext mContext) {
    Scaffold.of(mContext).openEndDrawer();
  }

  @override
  int position;
}
