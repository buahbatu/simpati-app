import 'package:flutter/material.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/presentation/mother/fragment/kids/fragment.dart';
import 'package:simpati/presentation/mother/fragment/pregnancy/fragment.dart';
import 'package:simpati/presentation/mother/fragment/profile/fragment.dart';

class MotherInfoPage extends StatelessWidget {
  final Mother initialData;

  const MotherInfoPage({Key key, this.initialData}) : super(key: key);

  Widget createAppBar(BuildContext context) {
    return AppBar(
      title: Text(initialData?.fullName ?? 'Tambah Ibu'),
      actions: <Widget>[
        if (initialData == null)
          FlatButton(
            child: Text('Simpan'),
            textColor: Colors.white,
            onPressed: () {},
          ),
      ],
      bottom: TabBar(
        indicatorColor: Colors.black54,
        tabs: [
          Tab(text: 'Profil'),
          Tab(text: 'Kehamilan'),
          Tab(text: 'Anak'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: createAppBar(context),
        body: TabBarView(
          children: [
            MotherProfileFragment(),
            MotherPregnancyFragment(),
            MotherKidsFragment(),
          ],
        ),
      ),
    );
  }
}
