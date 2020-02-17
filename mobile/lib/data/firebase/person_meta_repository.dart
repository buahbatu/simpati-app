import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/recap.dart';
import 'package:simpati/domain/entity/recap_config.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';

class PersonMetaRepository extends BaseFirestoreRepo
    implements IPersonMetaRepository {
  @override
  Future<BaseResponse<PersonMeta>> getMeta(
    String key,
    MetaConfigList metaConfigList,
  ) async {
    final meta = await firestore.collection(key).document(metaKey).get();

    final activeConfig = metaConfigList.data.where((e) => e.active).toList();
    final listRecap = List();
    for (MetaConfig config in activeConfig) {
      final recap = (await firestore
              .collection(key)
              .document(metaKey)
              .collection(recapKey)
              .document(config.key)
              .get())
          .data;
      listRecap.add(recap);
    }

    final rawData = {
      PersonMeta.sizeKey: meta.data[PersonMeta.sizeKey],
      PersonMeta.listKey: {RecapList.recapsKey: listRecap}
    };
    final personMeta = parserFactory.decode<PersonMeta>(rawData);
    return BaseResponse(
      meta.data,
      Status.success,
      'Load meta berhasil',
      personMeta,
    );
  }

  static const String metaKey = 'metadata';
  static const String recapKey = 'recaps';
}
