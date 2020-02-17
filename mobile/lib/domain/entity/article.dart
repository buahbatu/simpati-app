import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/core/utils/date_utils.dart';

class Article extends Equatable implements Data {
  final String picture;
  final String title;
  final String author;
  final DateTime createdAt;
  final String url;
  Article({this.picture, this.title, this.author, this.createdAt, this.url});

  static Article mock = Article(
    picture: 'assets://assets/tempe.jpg',
    title: 'Tempe, Pangan kaya bahan pencegah stunting',
    author: 'Kominfo Indonesia',
    createdAt: DateTime.now(),
    url: 'https://google.cm',
  );

  @override
  List<Object> get props => [
        this.picture,
        this.title,
        this.author,
        this.createdAt,
        this.url,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'picture': picture,
      'title': title,
      'author': author,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'url': url,
    };
  }

  static Article fromMap(Map<String, dynamic> map) {
    return Article(
      picture: map['picture'],
      title: map['title'],
      author: map['author'],
      createdAt: DateUtils.parseTimeData(map['createdAt']),
      url: map['url'],
    );
  }
}

class ArticleList extends Equatable implements Data {
  final List<Article> articles;

  ArticleList(this.articles);

  @override
  List<Object> get props => articles;

  @override
  Map<String, dynamic> toMap() {
    return {articleKey: articles.map((e) => e.toMap()).toList()};
  }

  static ArticleList fromMap(Map<String, dynamic> map) {
    final articleRawList = map[articleKey] as List;
    final list = articleRawList
        .map((e) => DataParserFactory.get().decode<Article>(e))
        .toList();
    return ArticleList(list);
  }

  static const String articleKey = 'articles';
}
