import 'package:flutter/material.dart';
import 'package:simpati/domain/entity/mother.dart';

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
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
