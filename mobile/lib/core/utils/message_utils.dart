import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';

extension MessageUtils on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackbar,
  ) {
    return Scaffold.of(this).showSnackBar(snackbar);
  }

  void showComingSoonNotice() {
    showSnackBar(SnackBar(content: Text('Coming Soon..')));
  }

  void showAppInfo({
    Nurse nurse,
    Posyandu posyandu,
    VoidCallback onLoginClick,
    VoidCallback onLogoutClick,
  }) async {
    bool isLogin = nurse != null && posyandu != null;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String name = packageInfo.version;

    if (packageInfo.packageName.split('.').last.toLowerCase() == 'debug')
      name += '-debug';

    var profileRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(posyandu?.fullName ?? '',
                style: AppTextStyle.title.copyWith()),
            Text(nurse?.fullName ?? '',
                style: AppTextStyle.caption.copyWith(color: Colors.white)),
          ],
        ),
        FlatButton(
          color: Colors.white,
          textColor: AppColor.primaryColor,
          child: Text('Logout'),
          onPressed: onLogoutClick,
        ),
      ],
    );
    showDialog(
      context: this,
      child: Dialog(
        backgroundColor: AppColor.primaryDarkColor,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text(
                'Simpati',
                style: AppTextStyle.calenderTitle
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
              Container(height: 2),
              Text('Ver $name',
                  style:
                      AppTextStyle.titleName.copyWith(color: Colors.white70)),
              Container(height: 20),
              if (isLogin) profileRow,
              if (!isLogin)
                FlatButton(
                  color: Colors.white,
                  textColor: AppColor.primaryColor,
                  child: Text('Login'),
                  onPressed: onLoginClick,
                ),
              Container(height: 20),
              Text(
                'Supported by',
                style: AppTextStyle.titleName
                    .copyWith(fontSize: 10, color: Colors.white),
              ),
              Container(height: 12),
              Row(
                children: <Widget>[
                  Image.asset('assets/sumedang.png', height: 18),
                  Container(width: 8),
                  Image.asset('assets/tsel.png', height: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
