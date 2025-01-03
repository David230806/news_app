import 'package:dartz/dartz.dart';
import 'package:news_app/data/models/viewed_article.dart';

abstract class MostViewedRepository {
  Future<Either<String, List<ViewedArticleModel>>> getArticles(int period);
}
