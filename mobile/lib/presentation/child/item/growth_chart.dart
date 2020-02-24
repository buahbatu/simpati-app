import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpati/core/classifier/graph_data_reader.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/presentation/child/item/bloc.dart';

class GrowthChart extends StatelessWidget {
  final Child child;

  const GrowthChart({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildInfoBloc, ChildInfoState>(
        builder: (context, state) {
      return Container(
        width: double.infinity,
        height: 160,
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(show: false),
            lineTouchData: const LineTouchData(enabled: false),
            lineBarsData: [
              ...getTemplateBars(state.imaginary),
              if (state.weightLine != null) getDataBar(state.weightLine)
            ],
            betweenBarsData: [
              ...getTemplateColors(state.imaginary),
            ],
            minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                reservedSize: 10,
                showTitles: true,
                textStyle: TextStyle(fontSize: 10, color: Colors.black45),
                getTitles: (value) {
                  if (value == 60) {
                    return '(bln)';
                  } else if (value % 6 == 0) {
                    return value.toInt().toString();
                  } else {
                    return '';
                  }
                },
                margin: 8,
              ),
              leftTitles: SideTitles(
                reservedSize: 12,
                showTitles: true,
                textStyle: TextStyle(fontSize: 10, color: Colors.black45),
                getTitles: (value) {
                  if (value % 5 == 0)
                    return value.toInt().toString();
                  else
                    return '';
                },
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) => const FlLine(
                color: Colors.black45,
                strokeWidth: 0.2,
              ),
              getDrawingVerticalLine: (value) => const FlLine(
                color: Colors.black45,
                strokeWidth: 0.2,
              ),
            ),
          ),
        ),
      );
    });
  }

  List<BetweenBarsData> getTemplateColors(List<Line> imaginary) {
    List<BetweenBarsData> datas = [];
    for (int i = 0; i < imaginary.length - 1; i++) {
      datas.add(BetweenBarsData(
        fromIndex: i,
        toIndex: i + 1,
        colors: [imaginary[i].lineColor.withOpacity(0.3)],
      ));
    }
    return datas;
  }

  List<LineChartBarData> getTemplateBars(List<Line> imaginary) {
    return imaginary.map((e) => getDataBar(e)).toList();
  }

  LineChartBarData getDataBar(Line line) {
    return LineChartBarData(
      spots: line.data,
      isCurved: true,
      barWidth: line.barWidth,
      colors: [line.lineColor],
      dotData: const FlDotData(show: false),
    );
  }
}
