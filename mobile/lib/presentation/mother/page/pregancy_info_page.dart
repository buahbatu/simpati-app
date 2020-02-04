import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/pregnancy.dart';

class PregnancyInfoPage extends StatelessWidget {
  final int index;
  final Pregnancy initialData;

  const PregnancyInfoPage(this.index, this.initialData, {Key key})
      : super(key: key);

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      backgroundColor: AppColor.appBackground,
      body: ListView(
        shrinkWrap: true,
        children: [
          // createNameSection(),
          // Container(height: 8),
          // createPhotoSection(),
        ],
      ),
    );
  }

  // Widget createNameSection() {
  //   return Container(
  //     color: Colors.white,
  //     padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(initialData.fullName, style: AppTextStyle.registerTitle),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: <Widget>[
  //             Icon(LineIcons.map_marker, size: 16, color: Colors.black38),
  //             Container(width: 4),
  //             Text(
  //               initialData.address,
  //               style: AppTextStyle.titleName.copyWith(fontSize: 12),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
