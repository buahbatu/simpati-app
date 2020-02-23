import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpati/core/classifier/graph_data_reader.dart';
import 'package:simpati/data/firebase/child_repository.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/usecase/load_child_check_usecase.dart';

class GrowthChartEvent {}

class GrowthChartState {
  final List<Line> lines;
  final Line weightLine;

  GrowthChartState(this.lines, {this.weightLine});
}

class GrowthChartBloc extends Bloc<GrowthChartEvent, GrowthChartState> {
  final Child child;
  final GraphDataReader dataReader;
  final LoadChildCheckUsecase _loadChildCheckUsecase;
  GrowthChartState state = GrowthChartState([]);

  GrowthChartBloc(
    this.child,
    AssetBundle bundle, {
    GraphDataReader dataReader,
    IChildRepository childRepository,
  })  : this.dataReader = dataReader ?? GraphDataReader(child.isGirl, bundle),
        this._loadChildCheckUsecase = LoadChildCheckUsecase(
          childRepository ?? ChildRepository(),
        );

  @override
  GrowthChartState get initialState => GrowthChartState([]);

  @override
  Stream<GrowthChartState> mapEventToState(GrowthChartEvent event) async* {
    final lines = await dataReader.getWeightLines();
    yield GrowthChartState(lines);

    final checks = await _loadChildCheckUsecase.start(child);

    final weightLine = checks.data.childMeds
        .map(
          (e) => FlSpot(
            (e.createdAt.month - child.birthDate.month).toDouble(),
            e.weight,
          ),
        )
        .toList();
    final weightLineData = Line(
      'Data',
      weightLine,
      Colors.black87,
      barWidth: 1,
    );
    yield GrowthChartState(lines, weightLine: weightLineData);
  }
}
