part of 'viewed_articles_bloc.dart';

@immutable
sealed class ViewedArticlesState {}

final class ViewedArticlesInitial extends ViewedArticlesState {}

final class ViewedArticlesLoading extends ViewedArticlesState {}

final class ViewedArticlesSuccess extends ViewedArticlesState {
  final List<ViewedArticleModel> articles;

  ViewedArticlesSuccess({required this.articles});
}

final class ViewedArticlesFailed extends ViewedArticlesState {
  final String error;

  ViewedArticlesFailed(this.error);
}
