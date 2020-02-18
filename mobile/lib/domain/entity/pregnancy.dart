import 'package:intl/intl.dart';

class Pregnancy {
  final DateTime lastMenstruation;
  final MenstruationCycle period;
  final double weight;
  final double height;
  final String bloodPressure;

  Pregnancy(
    this.lastMenstruation,
    this.period,
    this.weight,
    this.height,
    this.bloodPressure,
  );

  static Pregnancy mock = Pregnancy(
    DateFormat('dd/MM/yyyy').parse('1/10/2019'),
    MenstruationCycle.short,
    50,
    150,
    '120/20',
  );
}

class MenstruationCycle {
  final String id;
  final String title;

  MenstruationCycle(this.id, this.title);

  static MenstruationCycle short = MenstruationCycle(
    '1',
    'Pendek (<28 Hari)',
  );

  static MenstruationCycle regular = MenstruationCycle(
    '2',
    'Normal (28-30 Hari)',
  );

  static MenstruationCycle long = MenstruationCycle(
    '3',
    'Panjang (>30 Hari)',
  );
}
