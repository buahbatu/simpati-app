import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/article.dart';

class ArticleCard extends StatelessWidget {
  final Article data;

  const ArticleCard(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                  image: AssetImage(data.imagePath),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
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
