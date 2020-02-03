import 'package:flutter/material.dart';
import 'package:simpati/domain/entity/kid.dart';

class KidInfoPage extends StatelessWidget {
  final Kid initialData;

  const KidInfoPage({Key key, this.initialData}) : super(key: key);
  
  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text('Tambah Anak'),
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          child: Text('Simpan'),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
    );
  }
}
