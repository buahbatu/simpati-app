import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_images.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/presentation/app/app_bloc.dart';
import 'package:simpati/presentation/auth/screen.dart';
import 'package:simpati/presentation/mother/fragment/home/bloc.dart';
import 'package:simpati/presentation/mother/fragment/home/item/mother_card.dart';
import 'package:simpati/presentation/mother/page/add_page.dart';
import 'package:simpati/presentation/home/bloc.dart';
import 'package:simpati/presentation/home/fragment.dart';
import 'package:simpati/core/utils/message_utils.dart';

class MotherFragment implements BaseHomeFragment {
  MotherFragment(this.position);

  @override
  void onTabSelected(BuildContext mContext) {
    BlocProvider.of<HomeScreenBloc>(mContext).add(this);
  }

  @override
  BottomNavyBarItem bottomNavyBarItem = BottomNavyBarItem(
    icon: Icon(LineIcons.female),
    title: Text('Ibu'),
    activeColor: AppColor.primaryColor,
    inactiveColor: Colors.grey,
  );

  @override
  Widget view = _HomeScreen();

  @override
  int position;
}

class _HomeScreen extends StatelessWidget {
  Widget createActionButton() {
    return BlocBuilder<AppBloc, AppState>(
      builder: (ctx, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: MaterialButton(
            onPressed: () async {
              if (state.posyandu != null) {
                addMotherData(ctx);
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
      },
    );
  }

  void addMotherData(BuildContext context) async {
    // ignore: close_sinks
    final bloc = BlocProvider.of<MotherBloc>(context);
    final data = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MotherAddPage(),
      ),
    );

    // if data != null
    bloc.add(Add(Mother.mock));
  }

  Widget createAppBar(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (ctx, state) {
      return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Wrap(
          direction: Axis.vertical,
          spacing: 2,
          children: <Widget>[
            Text(
              'Daftar Ibu',
              style: AppTextStyle.title.copyWith(
                color: AppColor.primaryColor,
                fontSize: state.posyandu != null ? 16 : 18,
              ),
            ),
            if (state.posyandu != null)
              Text(
                '${state.posyandu.metadata.momCount} Orang',
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final safeHeight = MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (ctx) => MotherBloc(),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              createAppBar(context),
              Expanded(child: getContents())
            ],
          ),
          Container(height: safeHeight, color: AppColor.primaryColor),
          Align(
            alignment: Alignment.bottomRight,
            child: createActionButton(),
          )
        ],
      ),
    );
  }

  Widget getContents() {
    return BlocBuilder<MotherBloc, ScrollFragmentState<Mother>>(
      builder: (context, state) {
        return state.items.isNotEmpty
            ? ListView(
                padding: const EdgeInsets.all(0),
                children: state.items.map((d) => MotherCard(d)).toList(),
              )
            : BlocBuilder<AppBloc, AppState>(
                builder: (ctx, appState) {
                  return Column(
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
      },
    );
  }
}
