import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/domain/repository/article_repository.dart';

class LoadArticleUsecase {
  final IArticleRepository articleRepository;

  LoadArticleUsecase(this.articleRepository);

  Future<BaseResponse<ArticleList>> start(int stop, {int start = 0}) async {
    return await articleRepository.getArticles(stop, start: start);
  }
}
