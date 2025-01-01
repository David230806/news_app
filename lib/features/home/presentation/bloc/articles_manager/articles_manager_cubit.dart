import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:news_app/features/home/data/models/viewed_article.dart';

class ArticlesManagerCubit extends Cubit<List<ViewedArticleModel>> {
  ArticlesManagerCubit() : super([]);

  List<ViewedArticleModel> allArticles = [];

  int articleIndex = 0;

  void initialize(List<ViewedArticleModel> articles) {
    allArticles = articles;
    log(allArticles.length);
    emit([allArticles[articleIndex], allArticles[articleIndex + 1], allArticles[articleIndex + 2]]);
  }

  void swapArticle() {
    articleIndex++;
    emit([allArticles[articleIndex], allArticles[articleIndex + 1], allArticles[articleIndex + 2]]);
  }
}
