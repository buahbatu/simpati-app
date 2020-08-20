import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/framework/mixin/ticker_action_mixin.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/feature/children/model/children.dart';
import 'package:simpati/feature/children/page/add_steps/step_1.dart';
import 'package:simpati/feature/children/page/add_steps/step_3.dart';
import 'package:simpati/feature/repository/children_repository.dart';

import 'add_steps/step_2.dart';

class ChildAddState {
  Children child;
  ChildAddState({this.child});
}

class ChildAddAction
    extends BaseAction<ChildAddScreen, ChildAddAction, ChildAddState>
    with TickerActionMixin {
  final apiChildRepo =
      Get.getRepository<ChildrenRepository>(ResDataSource.Remote);

  @override
  Future<ChildAddState> initState() async {
    final child = Children();
    return ChildAddState(child: child);
  }

  void updateFormData(
      {String anakKe,
      String tanggalLahir,
      String jenisKelamin,
      String nomorKK,
      String nik,
      String namaAnak,
      String beratLahir,
      String tinggi,
      String kia,
      String imd,
      String namaOrtu,
      String nikOrtu,
      String hpOrtu,
      String alamat,
      String rt,
      String rw}) {
    if (anakKe != null) state.child = state.child.copyWith(anakKe: anakKe);
    if (tanggalLahir != null)
      state.child = state.child.copyWith(tanggalLahir: tanggalLahir);
    if (jenisKelamin != null)
      state.child = state.child.copyWith(jenisKelamin: jenisKelamin);
    if (nomorKK != null) state.child = state.child.copyWith(nomorKK: nomorKK);
    if (nik != null) state.child = state.child.copyWith(nik: nik);
    if (namaAnak != null)
      state.child = state.child.copyWith(namaAnak: namaAnak);
    if (beratLahir != null)
      state.child = state.child.copyWith(beratLahir: beratLahir);
    if (tinggi != null) state.child = state.child.copyWith(tinggi: tinggi);
    if (kia != null) state.child = state.child.copyWith(kia: kia);
    if (imd != null) state.child = state.child.copyWith(imd: imd);
    if (namaOrtu != null) state.child = state.child.copyWith(ibu: namaOrtu);
    if (nikOrtu != null) state.child = state.child.copyWith(nikIbu: nikOrtu);
    if (hpOrtu != null) state.child = state.child.copyWith(hpIbu: hpOrtu);
    if (alamat != null) state.child = state.child.copyWith(alamat: alamat);
    if (rt != null) state.child = state.child.copyWith(rt: rt);
    if (rw != null) state.child = state.child.copyWith(rw: rw);
  }

  void addChild(Children newChild) async {
    final result = await apiChildRepo.add(newChild);
    if (result.isError) {
      showSnackBar(message: result.failure.data);
    } else if (result.isSuccess) {
      Get.back();
      showSnackBar(message: "Berhasil menambahkan ibu");
    }
  }
}

class ChildAddScreen
    extends BaseView<ChildAddScreen, ChildAddAction, ChildAddState> {
  @override
  ChildAddAction initAction() {
    return ChildAddAction();
  }

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

  bool isFilled<T>(T value) {
    if (value is String) {
      return value != null && value.isNotEmpty;
    }
    return value != null;
  }

  @override
  Widget render(
      BuildContext context, ChildAddAction action, ChildAddState state) {
    TabController _tabController = new TabController(length: 3, vsync: action);
    return Scaffold(
      backgroundColor: ResColor.appBackground,
      appBar: createAppBar(context),
      body: TabBarView(
        controller: _tabController,
        children: [
          Step1AddChild(onButtonClick: () {
            if (!isFilled(state.child.anakKe) ||
                !isFilled(state.child.namaAnak) ||
                !isFilled(state.child.nomorKK)) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Isi semua kolom terlebih dulu'),
                ),
              );
            } else {
              print(state.child);
              _tabController.animateTo(1);
            }
          }),
          Step2AddChild(
            onButtonClick: () {
              if (!isFilled(state.child.tinggi) ||
                  !isFilled(state.child.beratLahir) ||
                  !isFilled(state.child.kia) ||
                  !isFilled(state.child.imd)) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Isi semua kolom terlebih dulu'),
                  ),
                );
              } else {
                //   // bloc.add(AddChildEvent());
                print(state.child);

                _tabController.animateTo(2);
              }
            },
          ),
          Step3AddChild(
            onButtonClick: () {
              if (!isFilled(state.child.ibu) || !isFilled(state.child.alamat)) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Isi semua kolom terlebih dulu'),
                  ),
                );
              } else {
                print(state.child);

                action.addChild(state.child);
              }
            },
          ),
        ],
      ),
    );
  }
}
