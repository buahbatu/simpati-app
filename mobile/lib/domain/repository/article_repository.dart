import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/article.dart';

abstract class IArticleRepository {
  Future<BaseResponse<ArticleList>> getArticles(int stop, {int start = 0});
}
