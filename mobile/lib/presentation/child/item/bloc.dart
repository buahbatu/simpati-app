import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpati/core/classifier/graph_data_reader.dart';
import 'package:simpati/data/firebase/child_repository.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/child_check.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/usecase/create_child_check_usecase.dart';
import 'package:simpati/domain/usecase/load_child_check_usecase.dart';

class ChildInfoEvent {}

class Add extends ChildInfoEvent {
  final ChildCheck check;

  Add(this.check);
}

class ChildInfoState {
  final List<Line> lines;
  final List<Line> imaginary;
  final List<ChildCheck> checks;
  final Line weightLine;

  ChildInfoState({
    this.lines = const [],
    this.imaginary = const [],
    this.checks = const [],
    this.weightLine,
  });

  ChildInfoState copyWith({
    List<Line> lines,
    List<ChildCheck> checks,
    Line weightLine,
  }) {
    return ChildInfoState(
      lines: lines ?? this.lines,
      checks: checks ?? this.checks,
      weightLine: weightLine ?? this.weightLine,
    );
  }
}

class ChildInfoBloc extends Bloc<ChildInfoEvent, ChildInfoState> {
  final Child child;
  final GraphDataReader dataReader;
  final LoadChildCheckUsecase _loadChildCheckUsecase;
  final CreateChildCheckUsecase _createChildCheckUsecase;

  ChildInfoState state = ChildInfoState();

  ChildInfoBloc(
    this.child,
    AssetBundle bundle, {
    GraphDataReader dataReader,
    IChildRepository childRepository,
  })  : this.dataReader = dataReader ?? GraphDataReader(child.isGirl, bundle),
        this._loadChildCheckUsecase = LoadChildCheckUsecase(
          childRepository ?? ChildRepository(),
        ),
        this._createChildCheckUsecase = CreateChildCheckUsecase(
          childRepository ?? ChildRepository(),
        );

  @override
  ChildInfoState get initialState => ChildInfoState();

  @override
  Stream<ChildInfoState> mapEventToState(ChildInfoEvent event) async* {
    if (event is! Add) {
      final lines = await dataReader.getWeightLines(isImiginary: false);
      yield ChildInfoState(lines: lines);

      final imaginary = await dataReader.getWeightLines(isImiginary: true);
      yield ChildInfoState(lines: lines, imaginary: imaginary);

      final checks = await _loadChildCheckUsecase.start(child);

      if (checks.isSuccess()) {
        yield ChildInfoState(
          lines: lines,
          imaginary: imaginary,
          checks: checks.data.childMeds,
        );
      }

      final weightLine = checks.data.childMeds
          .map((e) => FlSpot(
              (e.createdAt.month - child.birthDate.month).toDouble(), e.weight))
          .toList();

      final weightLineData = Line(
        'Data',
        weightLine,
        Colors.black87,
        barWidth: 1,
      );
      final newState = ChildInfoState(
        lines: lines,
        imaginary: imaginary,
        checks: checks.data.childMeds,
        weightLine: weightLineData,
      );
      yield newState;
      state = newState;
    } else if (event is Add) {
      final result = await _createChildCheckUsecase.start(child, event.check);
      if (result.isSuccess()) {
        final items = state.checks;
        items.add(result.data);
        items.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        final newState = state.copyWith(checks: items);
        yield newState;
        state = newState;
      }
    }
  }
}
