import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/recap.dart';
import 'package:simpati/domain/entity/recap_config.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';

class PersonMetaRepository extends BaseFirestoreRepo
    implements IPersonMetaRepository {
  static const String metaKey = 'metadata';
  static const String recapKey = 'recaps';

  @override
  Future<BaseResponse<PersonMeta>> getMeta(
    String key,
    MetaConfigList metaConfigList,
  ) async {
    final meta = await firestore.collection(metaKey).document(key).get();

    final activeConfig = metaConfigList.data.where((e) => e.active).toList();
    final listRecap = List();
    for (MetaConfig config in activeConfig) {
      final recap = (await firestore
              .collection(metaKey)
              .document(key)
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

  @override
  Future<BaseResponse<Data>> updateMeta<T extends Data>(
    String key,
    MetaConfigList metaConfigList,
    T value,
  ) async {
    await firestore.collection(key).document(metaKey).updateData(
      {'size': FieldValue.increment(1)},
    );

    // TODO: read classification on paper
    metaConfigList.data.forEach((element) async {
      await firestore
          .collection(key)
          .document(metaKey)
          .collection(recapKey)
          .document(element.key)
          .updateData({'value': FieldValue.increment(1)});
    });

    return BaseResponse(null, Status.success, 'Update meta berhasil', null);
  }
}