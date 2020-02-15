import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/presentation/app/app_bloc.dart';
import 'package:simpati/presentation/article/fragment/item/article_card.dart';
import 'package:simpati/presentation/auth/screen.dart';
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
  Widget createAppBar() {
    return BlocBuilder<AppBloc, AppState>(
      builder: (ctx, state) {
        final greeting = 'Selamat Datang!';

        return AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Wrap(
            direction: Axis.vertical,
            spacing: 2,
            children: <Widget>[
              if (state.nurse != null)
                Text('Hi ${state.nurse.fullname},',
                    style: AppTextStyle.titleName),
              Text(
                greeting,
                style: AppTextStyle.title.copyWith(
                  color: AppColor.primaryColor,
                  fontSize: state.nurse != null ? 14 : 18,
                ),
              ),
            ],
          ),
          backgroundColor: AppColor.appBackground,
          actions: <Widget>[
            IconButton(
              icon: Icon(LineIcons.info),
              color: AppColor.primaryColor,
              onPressed: () => ctx.showAppInfo(
                nurse: state?.nurse,
                posyandu: state?.posyandu,
                onLoginClick: () => onLoginClick(ctx),
                onLogoutClick: () {
                  BlocProvider.of<AppBloc>(ctx).add(AppEvent.AppLogout);
                },
              ),
            )
          ],
        );
      },
    );
  }

  void onLoginClick(BuildContext context) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => AuthScreen(),
    ));
    if (result == true) {
      Navigator.of(context).pop();
      BlocProvider.of<AppBloc>(context).add(AppEvent.AppLogin);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Berhasil'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final safeHeight = MediaQuery.of(context).padding.top;
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (ctx) => AppBloc()),
        BlocProvider<DashboardBloc>(create: (ctx) => DashboardBloc()),
      ],
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              createAppBar(),
              Expanded(child: createContent(context)),
            ],
          ),
          Container(height: safeHeight, color: AppColor.primaryColor),
        ],
      ),
    );
  }

  ListView createContent(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        getSpace(),
        getSection(
          context,
          SectionData(
            LineIcons.female,
            'Rekap Kondisi Ibu',
            2000,
            'orang',
            AppColor.redGradient,
            'assets/undraw_mom.svg',
            [
              CardData('Berat Ideal', '80%'),
              CardData('Gizi Baik', '90%'),
              CardData('Sedang Hamil', '300'),
            ],
          ),
        ),
        getSpace(),
        getSection(
          context,
          SectionData(
            LineIcons.child,
            'Rekap Kondisi Anak',
            2000,
            'orang',
            AppColor.yellowGradient,
            'assets/undraw_children.svg',
            [
              CardData('Berat Ideal', '80%'),
              CardData('Panjang Ideal', '90%'),
              CardData('Gizi Baik', '90%'),
              CardData('Sudah Imunisasi', '98%'),
              CardData('Telat Imunisasi', '30%'),
            ],
          ),
        ),
        getSpace(isSmall: true),
        ...getArticleSections(),
      ],
    );
  }

  Widget getSection(BuildContext context, SectionData data) {
    final horizontalItem = 3;
    final padding = 16 * 2 * 2;
    final space = 8 * (horizontalItem - 1);
    final contentWidth =
        (MediaQuery.of(context).size.width - padding - space) / horizontalItem;
    return Container(
      decoration: BoxDecoration(
        gradient: data.gradient,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: <Widget>[
          Align(
            child: SvgPicture.asset(data.assetPath, height: 120),
            alignment: Alignment.topRight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(data.iconData, size: 28, color: Colors.white),
                  Container(width: 2),
                  Text(
                    data.name,
                    style:
                        AppTextStyle.sectionTitle.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Container(height: 16),
              Text(
                NumberFormat().format(data.value),
                style: AppTextStyle.sectionData,
                textAlign: TextAlign.end,
              ),
              Text(
                data.unit,
                style: AppTextStyle.sectionData.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Container(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: data.items
                    .map((d) => DashboardContentCard(contentWidth, d))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getArticleSections() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Text(
          'Artikel Terbaru',
          style: AppTextStyle.title.copyWith(
            color: AppColor.primaryColor,
            fontSize: 16,
          ),
        ),
      ),
      ArticleCard(Article.mock),
      ArticleCard(Article.mock),
      ArticleCard(Article.mock),
    ];
  }

  Container getSpace({bool isSmall = true}) {
    return isSmall ? Container(height: 8) : Container(height: 28);
  }
}
