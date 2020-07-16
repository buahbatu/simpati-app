import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:simpati/core/domain/model/children_model.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/easter_egg.dart';
import 'package:simpati/feature/home/login/login_dialog.dart';
import 'package:simpati/feature/repository/children_repository.dart';

class ChildrenState {
  Children children;
  ChildrenState({this.children});
}

class ChildrenAction
    extends BaseAction<ChildrenScreen, ChildrenAction, ChildrenState> {
  final apiAssetRepo =
      Get.getRepository<ChildrenRepository>(ResDataSource.Remote);
  EasterEgg easterEgg = EasterEgg();

  @override
  Future<ChildrenState> initState() async {
    final child = await apiAssetRepo.getAll();
    if (child.isSuccess) {
      return ChildrenState(children: child.data);
    }
    return ChildrenState();
  }

  void getChildrens() async {
    // state.mother = await apiAssetRepo.getAll();
    // print(state.mother.data[0].slug.toString());
  }

  void navigateToLogin() async {
    await Get.to(LoginScreen());
    reloadScreen();
  }

  void openDialog() {
    Get.dialog(
        WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Allow the app to always use your location'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        'Please go to the app settings and accept the permissions.'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Go to app settings'),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            )),
        barrierDismissible: false);
  }

  void onAppBarClick() => easterEgg.onClick();
}

class ChildrenScreen
    extends BaseView<ChildrenScreen, ChildrenAction, ChildrenState> {
  @override
  ChildrenAction initAction() => ChildrenAction();

  @override
  Widget loadingViewBuilder(BuildContext context) => Container();

  @override
  Widget render(
      BuildContext context, ChildrenAction action, ChildrenState state) {
    return Scaffold(
      body: state.children != null
          ? ListView(
              children: state.children.data.map((e) => motherList(e)).toList(),
            )
          : Container(),
      appBar: createAppBar(action, context),
    );
  }

  Widget createAppBar(ChildrenAction action, BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => action.navigateToLogin(),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 2,
          children: [Text("Daftar Anak")],
        ),
      ),
    );
  }

  Widget motherList(ChildrenDatum data) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black26,
            child: Icon(LineAwesomeIcons.child, color: Colors.white),
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
