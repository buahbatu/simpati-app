import 'package:flutter/material.dart';

class KidAddPage extends StatelessWidget {
  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,

      // title: Wrap(
      //   direction: Axis.vertical,
      //   spacing: 2,
      //   children: <Widget>[
      //     Text(
      //       'Daftar Ibu',
      //       style: AppTextStyle.title.copyWith(
      //         color: AppColor.primaryColor,
      //         fontSize: 16,
      //       ),
      //     ),
      //     Text(
      //       '300 Orang',
      //       style: AppTextStyle.titleName.copyWith(fontSize: 12),
      //     ),
      //   ],
      // ),
      // backgroundColor: AppColor.appBackground,
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.search),
      //     color: AppColor.primaryColor,
      //     onPressed: () => context.showComingSoonNotice(),
      //   )
      // ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
    );
  }
}
