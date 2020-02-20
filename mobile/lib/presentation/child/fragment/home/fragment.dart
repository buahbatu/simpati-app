import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_images.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/presentation/app/app_bloc.dart';
import 'package:simpati/presentation/auth/screen.dart';
import 'package:simpati/presentation/home/bloc.dart';
import 'package:simpati/presentation/home/fragment.dart';
import 'package:simpati/core/utils/message_utils.dart';
import 'package:simpati/presentation/child/fragment/home/bloc.dart';
import 'package:simpati/presentation/child/fragment/home/item/child_card.dart';
import 'package:simpati/presentation/child/page/add_page/screen.dart';

class ChildFragment implements BaseHomeFragment {
  ChildFragment(this.position);

  @override
  void onTabSelected(BuildContext mContext) {
    BlocProvider.of<HomeScreenBloc>(mContext).add(this);
  }

  @override
  BottomNavyBarItem bottomNavyBarItem = BottomNavyBarItem(
    icon: Icon(LineIcons.child),
    title: Text('Anak'),
    activeColor: AppColor.primaryColor,
    inactiveColor: Colors.grey,
  );

  @override
  Widget view = _HomeScreen();

  @override
  int position;
}

class _HomeScreen extends StatelessWidget {
  Widget createActionButton(AppState state) {
    return Builder(builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: MaterialButton(
          onPressed: () async {
            if (state.posyandu != null) {
              addChildData(ctx);
            } else {
              await Navigator.of(ctx).push(
                MaterialPageRoute(builder: (ctx) => AuthScreen()),
              );
            }
          },
          color: AppColor.primaryColor,
          shape: CircleBorder(),
          padding: const EdgeInsets.all(16),
          child: Icon(LineIcons.plus, color: Colors.white),
        ),
      );
    });
  }

  void addChildData(BuildContext context) async {
    // ignore: close_sinks
    final bloc = BlocProvider.of<ChildBloc>(context);
    final appBloc = BlocProvider.of<AppBloc>(context);

    final data = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ChildAddPage()));

    if (data != null && data is Child) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Anak berhasil ditambahkan'),
          backgroundColor: Colors.green,
        ),
      );
      bloc.add(Add(data));
      appBloc.add(AppEvent.AppReLoaded);
    }
  }

  Widget createAppBar(BuildContext context, AppState state) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        children: <Widget>[
          Text(
            'Daftar Anak',
            style: AppTextStyle.title.copyWith(
              color: AppColor.primaryColor,
              fontSize: state.posyandu != null ? 16 : 18,
            ),
          ),
          if (state.posyandu != null)
            Text(
              '${state.posyandu.childCount}  Orang',
              style: AppTextStyle.titleName.copyWith(fontSize: 12),
            ),
        ],
      ),
      backgroundColor: AppColor.appBackground,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: AppColor.primaryColor,
          onPressed: () => context.showComingSoonNotice(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final safeHeight = MediaQuery.of(context).padding.top;
    return BlocBuilder<AppBloc, AppState>(builder: (ctx, state) {
      return BlocProvider(
        create: (ctx) =>
            ChildBloc(ChildFilter('posyanduId', state.posyandu?.id))
              ..add(Init()),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                createAppBar(context, state),
                Expanded(child: getContents(state))
              ],
            ),
            Container(height: safeHeight, color: AppColor.primaryColor),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: createActionButton(state),
            // )
          ],
        ),
      );
    });
  }

  Widget getContents(AppState appState) {
    return BlocBuilder<ChildBloc, ScrollFragmentState<Child>>(
      builder: (context, state) {
        return state.items.isNotEmpty
            ? ListView(
                padding: const EdgeInsets.all(0),
                children: state.items.map((d) => ChildCard(d)).toList(),
              )
            : Column(
                children: <Widget>[
                  Container(height: 64),
                  AppImages.noDataImage,
                  Container(height: 12),
                  Text(
                      appState.posyandu != null
                          ? 'Data Kosong'
                          : 'Kamu Belum Login',
                      style: AppTextStyle.titleName),
                ],
              );
      },
    );
  }

  Container getSpace({bool isSmall = true}) {
    return isSmall ? Container(height: 8) : Container(height: 28);
  }
}
