import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/presentation/child/fragment/add_steps/step_1.dart';
import 'package:simpati/presentation/child/fragment/add_steps/step_2.dart';
import 'package:simpati/presentation/child/page/add_page/bloc.dart';

class ChildAddPage extends StatefulWidget {
  final Mother momData;

  const ChildAddPage({Key key, this.momData}) : super(key: key);

  @override
  _ChildAddPageState createState() => _ChildAddPageState();
}

class _ChildAddPageState extends State<ChildAddPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
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
    return BlocProvider<AddChildBloc>(
      create: (ctx) => AddChildBloc(mom: widget.momData),
      child: Scaffold(
        backgroundColor: AppColor.appBackground,
        appBar: createAppBar(context),
        body: Builder(builder: (ctx) {
          final bloc = BlocProvider.of<AddChildBloc>(ctx);
          return BlocListener<AddChildBloc, AddChildState>(
            listener: (prev, next) {
              if (next == AddChildState.Success) {
                Navigator.of(context).pop(bloc.child);
              }
            },
            child: TabBarView(
              controller: _tabController,
              children: [
                Step1AddChild(onButtonClick: () {
                  final child = bloc.child;
                  if (!isFilled(child.fullName) ||
                      !isFilled(child.birthDate) ||
                      !isFilled(child.momName)) {
                    Scaffold.of(ctx).showSnackBar(
                      SnackBar(
                        content: Text('Isi semua kolom terlebih dulu'),
                      ),
                    );
                  } else {
                    _tabController.animateTo(1);
                  }
                }),
                Step2AddChild(
                  onButtonClick: () {
                    final child = bloc.child;
                    if (!isFilled(child.height) ||
                        !isFilled(child.weight) ||
                        !isFilled(child.temperature) ||
                        !isFilled(child.headSize) ||
                        !isFilled(child.bloodType)) {
                      Scaffold.of(ctx).showSnackBar(
                        SnackBar(
                          content: Text('Isi semua kolom terlebih dulu'),
                        ),
                      );
                    } else {
                      bloc.add(AddChildEvent());
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
