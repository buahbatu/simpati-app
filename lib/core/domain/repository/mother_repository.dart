import 'package:simpati/core/domain/model/mother_model.dart';
import 'package:simpati/core/domain/provider/mother_provider.dart';

class MotherRepository {
  MotherProvider provider = MotherProvider();

  Future<Mother> getMothersData() async {
    final response = await provider.getMotherAsync();
    return Mother.fromJson(response);
  }
}
