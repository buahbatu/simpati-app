import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:simpati/core/domain/model/mother.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/framework/mixin/ticker_action_mixin.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/feature/mother/page/add_steps/step_1.dart';
import 'package:simpati/feature/mother/page/add_steps/step_2.dart';
import 'package:simpati/feature/repository/mother_repository.dart';

class MotherAddState {
  String name;
  final String tinggi;
  String longAddress = "";
  String province = "Jawa Barat";
  String city = "Sumedang";
  MotherN motherRequest = MotherN();
  MotherAddState({this.motherRequest, this.name, this.tinggi});

  MotherAddState copyWith({String name, String tinggi}) {
    return MotherAddState(
        motherRequest: motherRequest ?? this.name,
        name: name ?? this.name,
        tinggi: tinggi ?? this.tinggi);
  }
}

class MotherAddAction
    extends BaseAction<MotherAddScreen, MotherAddAction, MotherAddState>
    with TickerActionMixin {
  final apiAssetRepo =
      Get.getRepository<MotherRepository>(ResDataSource.Remote);
  @override
  Future<MotherAddState> initState() async {
    final motherRequest = MotherN();
    return MotherAddState(motherRequest: motherRequest);
  }

  void printing() {
    print(state.name); // alif
    state = state.copyWith(name: "alice");
    print(state.name); // alice
  }

  void updateFormData(
      {String nik,
      String name,
      String tanggalLahir1,
      String namaSuami,
      String bloodType}) {
    if (name != null)
      state.motherRequest = state.motherRequest.copyWith(title: name);
    if (nik != null)
      state.motherRequest = state.motherRequest.copyWith(nik: nik);
    if (tanggalLahir1 != null)
      state.motherRequest =
          state.motherRequest.copyWith(tanggalLahir: tanggalLahir1);
    if (namaSuami != null)
      state.motherRequest = state.motherRequest.copyWith(namaSuami: namaSuami);
  }

  bool isFilled<T>(T value) {
    if (value is String) {
      return value != null && value.isNotEmpty;
    }
    return value != null;
  }

  void updateFormData2(
      {String nomerTelpon,
      String alamat,
      String bloodType,
      String province,
      String longAddress,
      String completeAddress,
      String city}) {
    if (bloodType != null)
      state.motherRequest =
          state.motherRequest.copyWith(golonganDarah: bloodType);
    if (alamat != null)
      state.motherRequest = state.motherRequest.copyWith(alamat: alamat);
    if (nomerTelpon != null)
      state.motherRequest =
          state.motherRequest.copyWith(nomorHandphone: nomerTelpon);
    if (province != null) state.province = province;
    if (city != null) state.city = city;
    if (longAddress != null) state.longAddress = longAddress;
    if (longAddress != null)
      state.motherRequest = state.motherRequest.copyWith(
          alamat: "${state.longAddress}, ${state.city}, ${state.province}");
  }

  void addMother(MotherN newMother) async {
    final result = await apiAssetRepo.add(newMother);
    if (result.isError) {
      showSnackBar(message: result.failure.data);
    } else if (result.isSuccess) {
      showSnackBar(message: "Berhasil menambahkan ibu");
      Get.back();
    }
  }

  void completeAddress(String longAddress, String city, String province) {
    final completeAddress =
        "${state.longAddress}, ${state.city}, ${state.province}";
    updateFormData2(completeAddress: completeAddress);
  }
}

class MotherAddScreen
    extends BaseView<MotherAddScreen, MotherAddAction, MotherAddState> {
  @override
  MotherAddAction initAction() {
    return MotherAddAction();
  }

  @override
  Widget loadingViewBuilder(BuildContext context) => Container();

  @override
  Widget render(
      BuildContext context, MotherAddAction action, MotherAddState state) {
    TabController _tabController = TabController(vsync: action, length: 2);

    return Scaffold(
      appBar: createAppBar(context),
      body: TabBarView(controller: _tabController, children: [
        Step1Screen(
          onButtonClick: () {
            if (!action.isFilled(state.motherRequest.title) ||
                !action.isFilled(state.motherRequest.nik) ||
                !action.isFilled(state.motherRequest.namaSuami)) {
              Get.snackbar(
                null,
                'Isi semua kolom terlebih dulu',
                icon: Icon(LineAwesomeIcons.exclamation_circle),
              );
            } else {
              print(state.motherRequest.tanggalLahir);
              print(state.motherRequest.namaSuami);
              print(state.motherRequest.title);
              print(state.motherRequest.nik);
              _tabController.animateTo(1);
            }
          },
        ),
        Step2Screen(
          onButtonClick: () {
            if (!action.isFilled(state.motherRequest.nomorHandphone) ||
                !action.isFilled(state.motherRequest.alamat) ||
                !action.isFilled(state.motherRequest.golonganDarah)) {
              Get.snackbar(
                null,
                'Isi semua kolom terlebih dulu',
                icon: Icon(LineAwesomeIcons.exclamation_circle),
              );
            } else {
              print(state.motherRequest.nomorHandphone);
              print(state.motherRequest.golonganDarah);
              print(state.longAddress);
              print(state.city);
              print(state.motherRequest.alamat);
              action.addMother(state.motherRequest);
            }
          },
        ),
      ]),
    );
  }

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: ResColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: ResColor.appBackground,
    );
  }
}
