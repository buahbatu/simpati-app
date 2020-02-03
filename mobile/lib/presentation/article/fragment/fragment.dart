import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_images.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/presentation/article/fragment/bloc.dart';
import 'package:simpati/presentation/article/fragment/item/article_card.dart';
import 'package:simpati/presentation/dashboard/item/dashboard_content_card.dart';
import 'package:simpati/presentation/dashboard/item/card_data.dart';
import 'package:simpati/presentation/home/bloc.dart';
import 'package:simpati/presentation/home/fragment.dart';
import 'package:simpati/core/utils/message_utils.dart';

class ArticleFragment implements BaseHomeFragment {
  ArticleFragment(this.position);

  @override
  void onTabSelected(BuildContext mContext) {
    BlocProvider.of<HomeScreenBloc>(mContext).add(this);
  }

  @override
  BottomNavyBarItem bottomNavyBarItem = BottomNavyBarItem(
    icon: Icon(LineIcons.newspaper_o),
    title: Text('Artikel'),
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
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        children: <Widget>[
          Text(
            'Artikel Pilihan',
            style: AppTextStyle.title.copyWith(
              color: AppColor.primaryColor,
              fontSize: 16,
            ),
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
    return BlocProvider(
      create: (ctx) => ArticleBloc()..add(Init()),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              createAppBar(context),
              Expanded(child: createContents()),
            ],
          ),
          Container(height: safeHeight, color: AppColor.primaryColor),
        ],
      ),
    );
  }

  Widget createContents() {
    return BlocBuilder<ArticleBloc, ScrollFragmentState<Article>>(
      builder: (context, state) {
        return state.items.isNotEmpty
            ? ListView(
                padding: const EdgeInsets.all(0),
                children: state.items.map((d) => ArticleCard(d)).toList(),
              )
            : Column(
                children: <Widget>[
                  Container(height: 64),
                  AppImages.noDataImage,
                  Container(height: 12),
                  Text('Data Kosong', style: AppTextStyle.titleName),
                ],
              );
      },
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
            children: data.items.map((d) => buildCard(d)).toList(),
          )
        ],
      ),
    );
  }

  Widget buildCard(CardData data) {
    return DashboardContentCard(data);
  }
}
