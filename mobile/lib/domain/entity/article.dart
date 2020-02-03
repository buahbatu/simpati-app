class Article {
  final String imagePath;
  final String title;
  final String author;
  final DateTime publishTime;

  Article(this.imagePath, this.title, this.author, this.publishTime);

  static Article mock = Article(
    'assets/tempe.jpg',
    'Tempe, Pangan kaya bahan pencegah stunting',
    'Kominfo Indonesia',
    DateTime.now(),
  );
}
