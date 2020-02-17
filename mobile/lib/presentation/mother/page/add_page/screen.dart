import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/presentation/mother/fragment/add_steps/add_steps.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMotherBloc>(
      create: (ctx) => AddMotherBloc(),
      child: Builder(
        builder: (ctx) {
          return Scaffold(
            backgroundColor: AppColor.appBackground,
            appBar: createAppBar(context),
            body: TabBarView(
              controller: _tabController,
              children: [
                Step1AddMother(
                  onButtonClick: () {
                    _tabController.animateTo(1);
                  },
                ),
                Step2AddMother(
                  onButtonClick: () {
                    _tabController.animateTo(2);
                  },
                ),
                Step3AddMother(
                  onButtonClick: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
