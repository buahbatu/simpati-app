import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/network/network.dart';
import 'package:simpati/core/network/NetworkToken.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/repository/auth_repository.dart';

class LoginState {}

class LoginAction extends BaseAction<LoginScreen, LoginAction, LoginState> {
  String em, pass;
  final apiAssetRepo = Get.getRepository<AuthRepository>(ResDataSource.Remote);
  bool isReload = false;

  @override
  Future<LoginState> initState() async {
    openDialog();
    return LoginState();
  }

  void openDialog() {
    Get.dialog(
        WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Login', style: AppTextStyle.registerTitle),
              content: SingleChildScrollView(
                child: ListBody(children: getForm()),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Masuk',
                    style: AppTextStyle.titleName.copyWith(fontSize: 12),
                  ),
                  onPressed: () {
                    Get.back();
                    print(em);
                    print(pass);
                  },
                )
              ],
            )),
        barrierDismissible: false);
  }

  bool reloadWhenLoggedIn() {
    return isReload;
  }

  void getLogin(String email, String password) async {
    final result = await apiAssetRepo.login(em, pass);
    if (result.isSuccess) {
      Api.updateDio(token: NetworkToken(result.data.data.token));
      isReload = true;
      print(result.data.data.token);
      Get.back();
      Get.back();
      showSnackBar(message: "Halo, selamat datang...");
    }
    if (result.isError) {
      showSnackBar(message: "Username dan password salah");
    }
  }

  List<Widget> getForm() {
    return [
      Text(
        'Gunakan email dan password yang telah diberikan',
        style: AppTextStyle.titleName.copyWith(fontSize: 12),
      ),
      Container(height: 24),
      FormUtils.buildField('Email',
          inputType: TextInputType.emailAddress,
          onChanged: (data) => em = data,
          errorText: getEmailErrorText(em)),
      Container(height: 8),
      FormUtils.buildField('Password',
          obscureText: true,
          inputType: TextInputType.emailAddress,
          onChanged: (data) => pass = data,
          errorText: getPasswordErrorText(pass)),
      SizedBox(
        height: 12.0,
      ),
      RaisedButton(
        color: ResColor.primaryColor,
        child: Text(
          'Masuk',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => getLogin(em, pass),
      )
    ];
  }

  String getEmailErrorText(String state) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(
      pattern,
      caseSensitive: false,
      multiLine: false,
    );
    if (state == "") {
      return 'Kolom email tidak boleh kosong';
    } else if (state != null) {
      if (regex.hasMatch(state)) {
        return 'Format Email Salah';
      }
    }

    return null;
  }

  String getPasswordErrorText(String state) {
    if (state == "") {
      return 'Kolom password tidak boleh kosong';
    }
    if (state != null) {
      if (state.length < 6) {
        return 'Panjang password kurang';
      }
    }

    return null;
  }
}

class LoginScreen extends BaseView<LoginScreen, LoginAction, LoginState> {
  @override
  LoginAction initAction() {
    return LoginAction();
  }

  @override
  Widget loadingViewBuilder(BuildContext context) => Container();

  @override
  Widget render(BuildContext context, LoginAction action, LoginState state) {
    return Container(
      color: Colors.white,
    );
  }
}
