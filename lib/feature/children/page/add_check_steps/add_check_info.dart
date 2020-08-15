import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/framework/mixin/ticker_action_mixin.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/feature/children/model/children_check.dart';
import 'package:simpati/feature/children/page/add_check_steps/info_1.dart';
import 'package:simpati/feature/children/page/add_check_steps/info_2.dart';
import 'package:simpati/feature/children/page/add_check_steps/info_3.dart';

class AddCheckInfoState {
  ChildMedicalCheckup childCheck;
  AddCheckInfoState({this.childCheck});
}

class AddCheckInfoAction extends BaseAction<AddCheckInfoScreen,
    AddCheckInfoAction, AddCheckInfoState> with TickerActionMixin {
  @override
  Future<AddCheckInfoState> initState() async {
    final childCheck = ChildMedicalCheckup();
    return AddCheckInfoState(childCheck: childCheck);
  }

  void updateFormData(
      {String tanggalPeriksa,
      String bb,
      String pb,
      String metodeUkur,
      String lk,
      String umurHari}) {
    if (tanggalPeriksa != null)
      state.childCheck = state.childCheck.copyWith(tanggalCek: tanggalPeriksa);
    if (bb != null)
      state.childCheck = state.childCheck.copyWith(beratBadan: bb);
    if (pb != null)
      state.childCheck = state.childCheck.copyWith(panjangBadan: pb);
    if (metodeUkur != null)
      state.childCheck =
          state.childCheck.copyWith(metodePengukuran: metodeUkur);
    if (umurHari != null)
      state.childCheck = state.childCheck.copyWith(umurDalamHari: umurHari);
    if (lk != null)
      state.childCheck = state.childCheck.copyWith(diameterKepala: lk);
  }
}

class AddCheckInfoScreen extends BaseView<AddCheckInfoScreen,
    AddCheckInfoAction, AddCheckInfoState> {
  @override
  AddCheckInfoAction initAction() => AddCheckInfoAction();

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

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: ResColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: ResColor.appBackground,
    );
  }

  @override
  Widget render(BuildContext context, AddCheckInfoAction action,
      AddCheckInfoState state) {
    TabController _tabController = new TabController(length: 3, vsync: action);
    return Scaffold(
      backgroundColor: ResColor.appBackground,
      appBar: createAppBar(context),
      body: TabBarView(
        controller: _tabController,
        children: [
          AddCheckInfo1(onButtonClick: () {
            if (state.childCheck.tanggalCek == "") {
              var formatter = new DateFormat('yyyy-MM-dd');
              state.childCheck = state.childCheck
                  .copyWith(tanggalCek: formatter.format(DateTime.now()));
            }
            state.childCheck;
            _tabController.animateTo(1);
          }),
          AddCheckInfo2(onButtonClick: () {}),
          AddCheckInfo3(onButtonClick: () {}),
        ],
      ),
    );
  }
}
