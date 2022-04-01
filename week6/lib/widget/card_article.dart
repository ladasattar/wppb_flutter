import 'package:flutter/material.dart';
import 'package:flutter_application/data/model/article.dart';
import 'package:flutter_application/ui/article_detail_page.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  // ignore: use_key_in_widget_constructors
  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(article.title),
        subtitle: Text(article.author!),
        onTap: () => Navigator.pushNamed(
          context,
          ArticleDetailPage.routeName,
          arguments: article,
        ),
      ),
    );
  }
}
