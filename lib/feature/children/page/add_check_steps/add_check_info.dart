import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/framework/mixin/ticker_action_mixin.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/feature/children/model/children_check.dart';
import 'package:simpati/feature/children/page/add_check_steps/info_1.dart';
import 'package:simpati/feature/children/page/add_check_steps/info_3.dart';
import 'package:simpati/feature/repository/children_repository.dart';

class AddCheckInfoState {
  ChildMedicalCheckup childCheck;
  final String idAnak;
  AddCheckInfoState({this.childCheck, this.idAnak});
}

class AddCheckInfoAction extends BaseAction<AddCheckInfoScreen,
    AddCheckInfoAction, AddCheckInfoState> with TickerActionMixin {
  final apiChildRepo =
      Get.getRepository<ChildrenRepository>(ResDataSource.Remote);
  String id;
  AddCheckInfoAction(this.id);

  @override
  Future<AddCheckInfoState> initState() async {
    final childCheck = ChildMedicalCheckup();
    return AddCheckInfoState(childCheck: childCheck, idAnak: id);
  }

  void updateFormData({
    String tanggalPeriksa,
    String bb,
    String pb,
    String metodeUkur,
    String lk,
    String umurHari,
    String giziBbU,
    String giziTbU,
    String giziBbTb,
    String vitA,
    String asi1,
    String asi2,
    String asi3,
    String asi4,
    String asi5,
    String asi6,
    String pemberianKe,
    String sumberPmt,
    String pemberianPus,
    String thnProduksi,
    String pemberianDae,
  }) {
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
    if (giziBbU != null)
      state.childCheck = state.childCheck.copyWith(statusGiziBbU: giziBbU);
    if (giziTbU != null)
      state.childCheck = state.childCheck.copyWith(statusGiziTbU: giziTbU);
    if (giziBbTb != null)
      state.childCheck = state.childCheck.copyWith(statusGiziBbTb: giziBbTb);
    if (vitA != null)
      state.childCheck = state.childCheck.copyWith(vitaminA: vitA);

    if (asi1 != null)
      state.childCheck = state.childCheck.copyWith(asiBulan1: asi1);
    if (asi2 != null)
      state.childCheck = state.childCheck.copyWith(asiBulan2: asi2);
    if (asi3 != null)
      state.childCheck = state.childCheck.copyWith(asiBulan3: asi3);
    if (asi4 != null)
      state.childCheck = state.childCheck.copyWith(asiBulan4: asi4);
    if (asi5 != null)
      state.childCheck = state.childCheck.copyWith(asiBulan5: asi5);
    if (asi6 != null)
      state.childCheck = state.childCheck.copyWith(asiBulan6: asi6);
    if (thnProduksi != null)
      state.childCheck = state.childCheck.copyWith(tahunProduksi: thnProduksi);
    if (pemberianKe != null)
      state.childCheck = state.childCheck.copyWith(pemberianKe: pemberianKe);
    if (sumberPmt != null)
      state.childCheck = state.childCheck.copyWith(sumberPmt: sumberPmt);
    if (pemberianPus != null)
      state.childCheck =
          state.childCheck.copyWith(pemberianPusat: pemberianPus);
    if (pemberianDae != null)
      state.childCheck =
          state.childCheck.copyWith(pemberianDaerah: pemberianDae);
  }

  void addMedicalCheckUp(ChildMedicalCheckup medCheck) async {
    ChildMedicalCheckup request = medCheck.copyWith(anak: state.idAnak);
    final result = await apiChildRepo.addChildMedicalCheckUp(request);
    if (result.isSuccess) {
      Get.back();
      reloadScreen();
    }
  }
}

class AddCheckInfoScreen extends BaseView<AddCheckInfoScreen,
    AddCheckInfoAction, AddCheckInfoState> {
  final String id;
  AddCheckInfoScreen(this.id);
  @override
  AddCheckInfoAction initAction() => AddCheckInfoAction(id);

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
    TabController _tabController = new TabController(length: 2, vsync: action);
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
          AddCheckInfo3(onButtonClick: () {
            state.childCheck;
            action.addMedicalCheckUp(state.childCheck);
          }),
        ],
      ),
    );
  }
}
