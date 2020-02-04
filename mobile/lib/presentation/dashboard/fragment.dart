import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:native_color/native_color.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/presentation/dashboard/bloc.dart';
import 'package:simpati/presentation/dashboard/item/dashboard_content_card.dart';
import 'package:simpati/presentation/dashboard/item/card_data.dart';
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
    final userName = 'Khusnaini Aghniya';
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
          onPressed: () => context.showAppInfo(
            userName: userName,
            posyanduName: posyanduName,
            onLoginClick: () {},
            onLogoutClick: () {},
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final safeHeight = MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (ctx) => DashboardBloc(),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              createAppBar(context),
              Expanded(child: createContent()),
            ],
          ),
          Container(height: safeHeight, color: AppColor.primaryColor),
        ],
      ),
    );
  }

  ListView createContent() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        getSpace(),
        getMotherSection(),
        SvgPicture.asset('assets/undraw_children.svg', height: 120),
        getSection(SectionData('Jumlah Pasien Kamu', [
          CardData('Ibu', '200000', 'orang', iconData: LineIcons.female),
          CardData('Anak', '200000', 'orang', iconData: LineIcons.child),
        ])),
        getSpace(isSmall: false),
        getSection(SectionData('Kondisi Ibu', [
          CardData('Fit', '80', '%', isNextLine: false),
          CardData('Kurang Fit', '20', '%', isNextLine: false),
        ])),
        getSpace(isSmall: false),
        getSection(SectionData('Kondisi Anak', [
          CardData('Sehat', '50', '%', isNextLine: false),
          CardData('Kurang Gizi', '30', '%', isNextLine: false),
          CardData('Stunting', '20', '%', isNextLine: false),
        ])),
        getSpace(isSmall: false),
        getSection(SectionData('Gender Anak', [
          CardData('Laki', '200000', 'orang'),
          CardData('Perempuan', '200000', 'orang'),
        ])),
        getSpace(isSmall: false),
      ],
    );
  }

  Container getMotherSection() {
    Gradient cardGradient = LinearGradient(
      colors: <Color>[
        // HexColor('F3B16D'),
        HexColor('FFE324'),
        HexColor('FFB533'),
      ],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: cardGradient,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      height: 200,
      child: Stack(
        children: <Widget>[
          Align(
            child: SvgPicture.asset('assets/undraw_mom.svg', height: 120),
            alignment: Alignment.topRight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(LineIcons.female, size: 28, color: Colors.white),
                  Container(width: 2),
                  Text('Data Ibu',
                      style: AppTextStyle.sectionTitle
                          .copyWith(color: Colors.white)),
                ],
              ),
              Text(
                '200000',
                style: AppTextStyle.sectionData.copyWith(color: Colors.white),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container getSpace({bool isSmall = true}) {
    return isSmall ? Container(height: 8) : Container(height: 28);
  }

  Widget getSection(SectionData data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(data.name, style: AppTextStyle.sectionTitle),
          getSpace(),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: data.items.map((d) => DashboardContentCard(d)).toList(),
          )
        ],
      ),
    );
  }
}
