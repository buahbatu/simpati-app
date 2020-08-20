import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/resources/res_strings.dart';
import 'package:simpati/core/utils/easter_egg.dart';
import 'package:simpati/feature/children/model/children.dart';
import 'package:simpati/feature/children/page/children_info_screen.dart';
import 'package:simpati/feature/repository/children_repository.dart';

class ChildrenState {
  List<Children> children;
  ChildrenState({this.children});
}

class ChildrenAction
    extends BaseAction<ChildrenScreen, ChildrenAction, ChildrenState> {
  final apiAssetRepo = Get.getRepository<ChildrenRepository>(
    ResDataSource.Remote,
  );
  EasterEgg easterEgg = EasterEgg();

  // TODO: implement request
  @override
  Future<ChildrenState> initState() async {
    final child = await apiAssetRepo.getAll();
    if (child.isSuccess) {
      return ChildrenState(children: child.data);
    }
    return ChildrenState();
  }

  void navigateToDetailChild(String id) async {
    Get.to(ChildrenInfoScreen(), arguments: id);
  }

  Future<void> getChildrens() async {
    final child = await apiAssetRepo.getAll();
    ChildrenState(children: child.data);
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
  Widget loadingViewBuilder(BuildContext context) => Container(
        child: Center(
          child: SpinKitChasingDots(
            color: ResColor.primaryColor,
            size: 50.0,
          ),
        ),
      );

  @override
  Widget render(
      BuildContext context, ChildrenAction action, ChildrenState state) {
    //TODO: implement body
    return Scaffold(
      body: state.children != null
          ? RefreshIndicator(
              onRefresh: () => action.getChildrens(),
              child: ListView(
                children:
                    state.children.map((e) => childrenList(e, action)).toList(),
              ),
            )
          : Container(),
      appBar: createAppBar(action, context),
    );
  }

  Widget createAppBar(ChildrenAction action, BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        children: [Text(ResString.TITLE_CHILDREN)],
      ),
    );
  }

  Widget childrenList(Children data, ChildrenAction action) {
    return InkWell(
      onTap: () => action.navigateToDetailChild(data.id),
      child: Container(
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
            childInfo(data),
            // Text(
            //   "6 bln",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            // )
          ],
        ),
      ),
    );
  }

  Widget childInfo(Children data) {
    return Column(
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
            "Anak Ibu ${data.ibu}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        createChip(data.statusGiziBbU ?? ""),
      ],
    );
  }

  Container createChip(String title) {
    return title != ""
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ResColor.accentColor),
            child: Text(title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
          )
        : Container();
  }
}
