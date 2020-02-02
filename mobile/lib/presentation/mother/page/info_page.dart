import 'package:flutter/material.dart';

class MotherInfoPage extends StatelessWidget {
  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text('Tambah Ibu'),
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
