import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';

class BaseFirestoreRepo {
  final Firestore firestore;
  final DataParserFactory parserFactory;

  BaseFirestoreRepo({
    Firestore firestore,
    DataParserFactory parserFactory,
  })  : this.firestore = firestore ?? Firestore.instance,
        this.parserFactory = parserFactory ?? DataParserFactory.get();
}
