import 'package:dartz/dartz.dart';
import 'package:news_app/core/configs/base_urls.dart';
import 'package:news_app/core/dio/dio_requests.dart';
import 'package:news_app/core/errors/exceprions.dart';
import 'package:news_app/data/models/viewed_article.dart';
import 'package:news_app/domain/repository/most_viewed_repository.dart';

class MostViewedRepositoryImpl extends MostViewedRepository {
  final DioRequests _dioRequests = DioRequests();

  @override
  Future<Either<String, List<ViewedArticleModel>>> getArticles(int period) async {
    try {
      if (period != 1 && period != 7 && period != 30) throw InvalidInputException("Invalid period");

      final res = await _dioRequests.get(
        path: "${BaseUrls.mostpopularModule}/${BaseUrls.secondVersion}/viewed/$period.json",
      );

      final List<ViewedArticleModel> articles = (res.data['results'] as List)
          .map(
            (e) => ViewedArticleModel.fromJson(e),
          )
          .toList();

      return Right(articles);
    } catch (e) {
      throw RequestException(e.toString());
    }
  }
}
