import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:simpati/core/domain/model/mother_model.dart';
import 'package:simpati/core/domain/repository/mother_repository.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/easter_egg.dart';
import 'package:simpati/core/utils/framework_service_locator.dart';

class MotherState {
  Mother mother;
  MotherState({this.mother});
}

class MotherAction extends BaseAction<MotherScreen, MotherAction, MotherState> {
  final apiAssetRepo =
      Get.getRepository<MotherRepository>(ResDataSource.Remote);
  EasterEgg easterEgg = EasterEgg();

  @override
  Future<MotherState> initState() async {
    final mother = await apiAssetRepo.getAll();
    return MotherState(mother: mother);
  }

  Future<MotherState> getMothers() async {
    final mother = await apiAssetRepo.getAll();
    return MotherState(mother: mother);
  }

  void onAppBarClick() => easterEgg.onClick();
}

class MotherScreen extends BaseView<MotherScreen, MotherAction, MotherState> {
  @override
  MotherAction initAction() => MotherAction();

  @override
  Widget loadingViewBuilder(BuildContext context) => Container();

  @override
  Widget render(BuildContext context, MotherAction action, MotherState state) {
    return Scaffold(
      body: state.mother != null
          ? ListView(
              children: state.mother.data.map((e) => motherList(e)).toList(),
            )
          : bodyStateBuilder(action, state),
      appBar: createAppBar(action),
      floatingActionButton: FloatingActionButton(
        onPressed: () => action.getMothers(),
        child: Icon(LineAwesomeIcons.plus),
        backgroundColor: ResColor.primaryColor,
      ),
    );
  }

  Widget bodyStateBuilder(MotherAction action, MotherState state) {
    return FutureBuilder(
        future: action.getMothers(),
        builder: (BuildContext context, AsyncSnapshot<MotherState> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container(
                child: Center(
                  child: SpinKitChasingDots(
                    color: ResColor.primaryColor,
                    size: 50.0,
                  ),
                ),
              );
              break;
            case ConnectionState.waiting:
              return Container(
                child: Center(
                  child: SpinKitChasingDots(
                    color: ResColor.primaryColor,
                    size: 50.0,
                  ),
                ),
              );
              break;
            case ConnectionState.active:
              return Container(
                child: Center(
                  child: SpinKitChasingDots(
                    color: ResColor.primaryColor,
                    size: 50.0,
                  ),
                ),
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              } else {
                return ListView(
                  children:
                      state.mother.data.map((e) => motherList(e)).toList(),
                );
              }
              break;
          }
          return Container();
        });
  }

  Widget createAppBar(MotherAction action) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => action.onAppBarClick(),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 2,
          children: [Text("Daftar Ibu")],
        ),
      ),
    );
  }

  Widget motherList(MotherDatum data) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black26,
            child: Icon(LineAwesomeIcons.female, color: Colors.white),
          ),
          SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                width: 270.0,
                child: Text(
                  "Jl. Kasih ibu dan cinta, Sumedang, Jawa Barat sasdasdasasd",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Wrap(
                spacing: 4,
                children: [
                  createChip("0 anak"),
                  createChip("Berat Ideal"),
                  createChip("Gizi Baik"),
                ],
              )
            ],
          ),
          Text(
            "25 Thn",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          )
        ],
      ),
    );
  }

  Container createChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: ResColor.accentColor),
      child: Text(title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )),
    );
  }
}
