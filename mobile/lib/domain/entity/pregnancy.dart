import 'package:intl/intl.dart';

class Pregnancy {
  final String id;
  final String idIbu;
  final DateTime lastMenstruation;
  final MenstruationPerion period;
  final double weight;
  final double height;
  final double bloodSystolic;
  final double bloodDiastolic;

  Pregnancy(this.id, this.idIbu, this.lastMenstruation, this.period,
      this.weight, this.height, this.bloodSystolic, this.bloodDiastolic);

  static Pregnancy mock = Pregnancy(
      '1',
      '1',
      DateFormat('dd/MM/yyyy').parse('1/10/2019'),
      MenstruationPerion.short,
      50,
      150,
      120,
      60);
}

class MenstruationPerion {
  final String id;
  final String title;

  MenstruationPerion(this.id, this.title);

  static MenstruationPerion short = MenstruationPerion(
    '1',
    'Pendek (<28 Hari)',
  );

  static MenstruationPerion regular =
      MenstruationPerion('1', 'Pendek (28-30 Hari)');

  static MenstruationPerion long =
      MenstruationPerion('1', 'Panjang (>30 Hari)');
}
