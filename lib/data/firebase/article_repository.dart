import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/domain/repository/article_repository.dart';

class ArticleRepository extends BaseFirestoreRepo
    implements IArticleRepository {
  @override
  Future<BaseResponse<ArticleList>> getArticles(
    int stop, {
    int start = 0,
  }) async {
    Query query = firestore.collection(articleKey).orderBy(
          createdKey,
          descending: true,
        );

    if (stop > -1) query = query.limit(stop);

    final snapshots = await query.getDocuments();

    final articles = snapshots.documents
        .map((e) => parserFactory.decode<Article>(e.data))
        .toList();

    return BaseResponse(
      null,
      Status.success,
      'Load Article success',
      ArticleList(articles),
    );
  }

  static const String articleKey = 'articles';
  static const String createdKey = 'createdAt';
}
