import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/presentation/mother/fragment/add_steps/step_1.dart';
import 'package:simpati/presentation/mother/fragment/add_steps/step_2.dart';
import 'package:simpati/presentation/mother/fragment/add_steps/step_3.dart';
import 'package:simpati/presentation/mother/page/add_page/bloc.dart';

class MotherAddPage extends StatefulWidget {
  final Mother initialData;

  const MotherAddPage({Key key, this.initialData}) : super(key: key);

  @override
  _MotherAddPageState createState() => _MotherAddPageState();
}

class _MotherAddPageState extends State<MotherAddPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: AppColor.appBackground,
    );
  }

  bool isFilled<T>(T value) {
    if (value is String) {
      return value != null && value.isNotEmpty;
    }
    return value != null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMotherBloc>(
      create: (ctx) => AddMotherBloc(),
      child: Scaffold(
        backgroundColor: AppColor.appBackground,
        appBar: createAppBar(context),
        body: Builder(builder: (ctx) {
          final bloc = BlocProvider.of<AddMotherBloc>(ctx);
          return TabBarView(
            controller: _tabController,
            children: [
              Step1AddMother(
                onButtonClick: () {
                  final mother = bloc.mother;
                  if (!isFilled(mother.nik) ||
                      !isFilled(mother.fullName) ||
                      !isFilled(mother.birthDate) ||
                      !isFilled(mother.husbandName)) {
                    Scaffold.of(ctx).showSnackBar(
                      SnackBar(content: Text('Isi semua kolom terlebih dulu')),
                    );
                  } else {
                    _tabController.animateTo(1);
                  }
                },
              ),
              Step2AddMother(
                onButtonClick: () {
                  final mother = bloc.mother;
                  if (!isFilled(mother.phone) ||
                      !isFilled(mother.address) ||
                      !isFilled(mother.province) ||
                      !isFilled(mother.city)) {
                    Scaffold.of(ctx).showSnackBar(
                      SnackBar(content: Text('Isi semua kolom terlebih dulu')),
                    );
                  } else {
                    _tabController.animateTo(2);
                  }
                },
              ),
              Step3AddMother(
                onButtonClick: () {
                  final mother = bloc.mother;
                  if (!isFilled(mother.height) ||
                      !isFilled(mother.weight) ||
                      !isFilled(mother.bloodPressure) ||
                      !isFilled(mother.bloodType)) {
                    Scaffold.of(ctx).showSnackBar(
                      SnackBar(content: Text('Isi semua kolom terlebih dulu')),
                    );
                  } else {
                    bloc.add(AddMotherEvent());
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
