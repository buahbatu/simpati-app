import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/transaction.dart';
import 'package:simpati/presentation/dashboard/bloc.dart';
import 'package:simpati/presentation/dashboard/item/dashboard_content_card.dart';
import 'package:simpati/presentation/dashboard/item/data.dart';
import 'package:simpati/presentation/home/bloc.dart';
import 'package:simpati/presentation/home/fragment.dart';
import 'package:simpati/core/utils/message_utils.dart';

class DashboardFragment implements BaseHomeFragment {
  DashboardFragment(this.position);

  @override
  void onTabSelected(BuildContext mContext) {
    BlocProvider.of<HomeScreenBloc>(mContext).add(this);
  }

  @override
  BottomNavyBarItem bottomNavyBarItem = BottomNavyBarItem(
    icon: Icon(LineIcons.home),
    title: Text('Beranda'),
    activeColor: AppColor.primaryColor,
    inactiveColor: Colors.grey,
  );

  @override
  Widget view = _HomeScreen();

  @override
  int position;
}

class _HomeScreen extends StatelessWidget {
  Widget createAppBar(BuildContext context) {
    final userName = 'Alif Akbar';
    final greeting = 'Selamat Datang!';
    final posyanduName = 'Posyandu Kasih Ibu';

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        children: <Widget>[
          Text('Hi $userName,', style: AppTextStyle.titleName),
          Text(
            greeting,
            style: AppTextStyle.title.copyWith(
              color: AppColor.primaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.appBackground,
      actions: <Widget>[
        IconButton(
          icon: Icon(LineIcons.info),
          color: AppColor.primaryColor,
          onPressed: () {
            context.showAppInfo(userName, posyanduName);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => DashboardBloc(),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          createAppBar(context),
          getSpace(),
          getSection(SectionData(
            'Jumlah Pasien Kamu',
            CardData('Ibu', '200', iconData: LineIcons.female),
            CardData('Anak', '200', iconData: LineIcons.child),
          )),
          getSpace(isSmall: false),
          getSection(SectionData(
            'Kondisi Ibu',
            CardData('Fit', '200'),
            CardData('Kurang Fit', '200'),
          )),
          getSpace(isSmall: false),
          getSection(SectionData(
            'Gender Anak',
            CardData('Ibu', '200', iconData: LineIcons.child),
            CardData('Anak', '200', iconData: LineIcons.child),
          )),
          getSpace(isSmall: false),
          getSection(SectionData(
            'Kondisi Anak',
            CardData('Sehat', '200'),
            CardData('Stunting', '200'),
          )),
          getSpace(isSmall: false),
        ],
      ),
    );
  }

  Container getSpace({bool isSmall = true}) {
    return isSmall ? Container(height: 8) : Container(height: 28);
  }

  Widget getSection(SectionData data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(data.name, style: AppTextStyle.sectionTitle),
          getSpace(),
          Row(
            children: <Widget>[
              buildCard(data.first),
              buildCard(data.second),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCard(CardData data) {
    return DashboardContentCard(data);
  }
}
