import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:simpati/core/resources/app_text_style.dart';

extension MessageUtils on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackbar,
  ) {
    return Scaffold.of(this).showSnackBar(snackbar);
  }

  void showComingSoonNotice() {
    showSnackBar(SnackBar(content: Text('Coming Soon..')));
  }

  void showAppInfo(String userName, String posyanduName) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String name = packageInfo.version;

    if (packageInfo.packageName.split('.').last.toLowerCase() == 'debug')
      name += '-debug';

    showDialog(
      context: this,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            direction: Axis.vertical,
            spacing: 2,
            children: <Widget>[
              Text(
                'Simpati',
                style: AppTextStyle.calenderTitle.copyWith(fontSize: 16),
              ),
              Text('Ver $name', style: AppTextStyle.titleName),
              Container(height: 20),
              Text(posyanduName, style: AppTextStyle.itemTitle),
              Text(userName,
                  style: AppTextStyle.caption.copyWith(color: Colors.black87)),
              Container(height: 20),
              Row(
                children: <Widget>[
                  Text(
                    'Supported by ',
                    style: AppTextStyle.titleName.copyWith(fontSize: 10),
                  ),
                  Image.asset(
                    'assets/tsel.png',
                    height: 16,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
