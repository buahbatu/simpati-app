import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_color/native_color.dart';

class Line {
  final String name;
  final List<FlSpot> data;
  final Color lineColor;
  final double barWidth;

  const Line(this.name, this.data, this.lineColor, {this.barWidth = .5});

  static const Line empty = Line('', [], Colors.black);
}

class GraphDataReader {
  final bool isGirl;
  final AssetBundle bundle;

  GraphDataReader(this.isGirl, this.bundle);

  Future<List<Line>> getWeightLines() async {
    final gender = isGirl ? 'girl' : 'boy';
    final rawString = await bundle.loadString(
      'assets/data/$gender/raw_bb_u.in',
    );
    final rawLines = rawString.split('\n');

    final datas = getDatas(rawLines);
    final dataImaginary = createImaginaryLine(datas);

    final lines = List<Line>();
    dataImaginary.asMap().forEach((i, value) {
      if (i == 0) {
        lines.add(Line('-4 SD', value, HexColor('E3292C')));
      } else if (i == 1) {
        lines.add(Line('-3 SD', value, Colors.redAccent));
      } else if (i == 2) {
        lines.add(Line('-2 SD', value, HexColor('FEAD20')));
      } else if (i == 3) {
        lines.add(Line('-1 SD', value, Colors.greenAccent));
      } else if (i == 4) {
        lines.add(Line('Median', value, HexColor('FEAD20')));
      } else if (i == 5) {
        lines.add(Line('+1 SD', value, Colors.redAccent));
      } else if (i == 6) {
        lines.add(Line('+2 SD', value, HexColor('E3292C')));
      } else if (i == 7) {
        lines.add(Line('+3 SD', value, HexColor('E3292C')));
      } else {
        lines.add(Line('+3 SD', value, HexColor('E3292C')));
      }
    });

    return lines;
  }

  List<List<FlSpot>> createImaginaryLine(List<List<FlSpot>> lines) {
    List<List<FlSpot>> imaginaryLines = [lines[0]];
    for (int i = 0; i < lines.length - 1; i++) {
      final first = lines[i];
      final second = lines[i + 1];

      final List<FlSpot> imaginaryLine = [];
      for (int j = 0; j < first.length; j++) {
        final delta = first[j].y + (second[j].y - first[j].y) / 2;
        imaginaryLine.add(FlSpot(first[j].x, delta));
      }
      imaginaryLines.add(imaginaryLine);
    }
    imaginaryLines.add(lines.last);
    return imaginaryLines;
  }

  List<List<FlSpot>> getDatas(List<String> rawLines) {
    final datas = List<List<FlSpot>>();
    rawLines.asMap().forEach(
          (age, l) => l.split(' ').asMap().forEach(
            (std, value) {
              if (datas.length < std + 1) {
                datas.add(List());
              }
              datas[std].add(FlSpot(age.toDouble(), double.parse(value)));
            },
          ),
        );
    return datas;
  }
}
