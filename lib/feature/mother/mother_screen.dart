import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/resources/res_strings.dart';
import 'package:simpati/core/storage/app_config.dart';
import 'package:simpati/core/utils/easter_egg.dart';
import 'package:simpati/feature/mother/model/mother.dart';
import 'package:simpati/feature/mother/page/mother_add.dart';
import 'package:simpati/feature/mother/page/mother_info_screen.dart';
import 'package:simpati/feature/repository/mother_repository.dart';

class MotherState {
  List<Mother> mother;
  MotherState({this.mother});
}

class MotherAction extends BaseAction<MotherScreen, MotherAction, MotherState> {
  final apiAssetRepo = Get.getRepository<MotherRepository>(
    ResDataSource.Remote,
  );
  EasterEgg easterEgg = EasterEgg();

  @override
  Future<MotherState> initState() async {
    final result = await apiAssetRepo.getAll();
    if (result.isError) showSnackBar(message: result.failure.data);
    if (result.isSuccess) {
      print(result.data.length);
      return MotherState(mother: result.data);
    }

    return MotherState(mother: []);
  }

  Future<void> getMothers() async {
    final mother = await apiAssetRepo.getAll();
    print(AppConfig.token.val.accessToken);
    MotherState(mother: mother.data);
    reloadScreen();
  }

  void onAppBarClick() => easterEgg.onClick();

  void navigateToMother(String id) {
    Get.to(MotherInfoScreen(), arguments: id);
  }

  void navigateAddMother() {
    Get.to(MotherAddScreen());
  }
}

class MotherScreen extends BaseView<MotherScreen, MotherAction, MotherState> {
  @override
  MotherAction initAction() => MotherAction();

  @override
  Widget loadingViewBuilder(BuildContext context) => Container(
        child: Center(
          child: SpinKitChasingDots(
            color: ResColor.primaryColor,
            size: 50.0,
          ),
        ),
      );

  @override
  Widget render(BuildContext context, MotherAction action, MotherState state) {
    return Scaffold(
      body: state.mother.isNotEmpty
          ? RefreshIndicator(
              onRefresh: () => action.getMothers(),
              child: motherList(action, state))
          : Container(),
      appBar: createAppBar(action),
      floatingActionButton: FloatingActionButton(
        onPressed: () => action.navigateAddMother(),
        child: Icon(LineAwesomeIcons.plus),
        backgroundColor: ResColor.primaryColor,
      ),
    );
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
          children: [Text(ResString.TITLE_MOTHER)],
        ),
      ),
    );
  }

  Widget motherList(MotherAction action, MotherState state) {
    return ListView(
      children: state.mother
          .map(
            (e) => InkWell(
              onTap: () => action.navigateToMother(e.id),
              child: Container(
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
                    motherInfo(e),
                    Text(
                      "25 Thn",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget motherInfo(Mother e) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          e.title,
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
