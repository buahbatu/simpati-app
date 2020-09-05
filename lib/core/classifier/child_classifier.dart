import 'package:simpati/core/classifier/graph_data_reader.dart';

class ChildClassifier {
  // TODO: buat statistik perkembangan anak
  // final Children child;

  // ChildClassifier(this.child);

  String classifyWeightByAge(List<Line> weightLine) {
    if (weightLine.isEmpty) return '';

    // final age = child.birthDate.countAgeMonths();
    // final weight = child.weight;

    final age = 15;
    final weight = 45;

    if (age > 60) return '';

    final stdLeftWeight = weightLine[2].data[age];
    final medianWeight = weightLine[3].data[age];
    final stdRightWeight = weightLine[4].data[age];

    double stdValue = 0;
    if (weight <= medianWeight.y) {
      stdValue = (weight - medianWeight.y) / (medianWeight.y - stdLeftWeight.y);
    } else {
      stdValue =
          (weight - medianWeight.y) / (stdRightWeight.y - medianWeight.y);
    }
    int std = stdValue.round();

    if (std < -3) {
      return 'Berat badan sangat kurang';
    } else if (std < -2) {
      return 'Berat badan kurang';
    } else if (std <= 1) {
      return 'Berat badan normal';
    } else {
      return 'Risiko Berat badan lebih';
    }
  }
}
