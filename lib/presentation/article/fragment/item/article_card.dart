import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/presentation/article/page/screen.dart';

class ArticleCard extends StatelessWidget {
  final Article data;

  const ArticleCard(this.data, {Key key}) : super(key: key);

  ImageProvider getImage(String path) {
    if (path.contains('assets://')) {
      final finalPath = path.replaceAll('assets://', '');
      return AssetImage(finalPath);
    } else {
      return NetworkImage(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => ArticleScreen(url: data.url)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: getImage(data.picture),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              width: double.infinity,
            ),
            Container(height: 8),
            Text(
              data.title,
              style: AppTextStyle.sectionData.copyWith(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Container(height: 4),
            Text(
              data.author,
              style: AppTextStyle.titleName.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
