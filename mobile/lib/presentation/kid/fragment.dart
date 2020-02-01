import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/transaction.dart';
import 'package:simpati/presentation/kid/bloc.dart';
import 'package:simpati/presentation/home/bloc.dart';
import 'package:simpati/presentation/home/fragment.dart';
import 'package:simpati/core/utils/message_utils.dart';

class KidFragment implements BaseHomeFragment {
  KidFragment(this.position);

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
  Widget createActionButton() {
    return Builder(
      builder: (ctx) {
        // ignore: close_sinks
        final bloc = BlocProvider.of<KidBloc>(ctx);
        return Padding(
          padding: const EdgeInsets.all(16),
          child: MaterialButton(
            onPressed: () {
              bloc.add(Add(Transaction.mock));
            },
            onLongPress: () async {
              print('long press');
              // TODO:
              // bool available = await speech.initialize(
              //   onStatus: onStatus,
              //   onError: onError,
              // );

              // if (!listening) {
              //   if (available) {
              //     speech.listen(onResult: onListen);
              //     listening = true;
              //   } else {
              //     print("The user has denied the use of speech recognition.");
              //     listening = false;
              //   }
              // } else {
              //   speech.stop();
              //   listening = false;
              // }
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

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        children: <Widget>[
          Text('Hi Alif Akbar,', style: AppTextStyle.titleName),
          Text(
            'Selamat Datang!',
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
          icon: Icon(Icons.search),
          color: AppColor.primaryColor,
          onPressed: () => context.showComingSoonNotice(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => KidBloc(),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              createAppBar(context),
              // CashflowCard(),
              Expanded(child: getContents())
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: createActionButton(),
          )
        ],
      ),
    );
  }

  Widget getContents() {
    return BlocBuilder<KidBloc, ScrollFragmentState<Transaction>>(
      builder: (context, state) {
        final String assetName = 'assets/no_data.svg';
        final Widget svg = SvgPicture.asset(
          assetName,
          height: 120,
          semanticsLabel: 'Data Kosong',
        );
        return Column(
          children: <Widget>[
            Container(height: 64),
            svg,
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
}
