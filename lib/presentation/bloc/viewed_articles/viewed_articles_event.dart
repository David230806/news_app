part of 'viewed_articles_bloc.dart';

@immutable
sealed class ViewedArticlesEvent {}

class GetViewedArticlesEvent extends ViewedArticlesEvent {
  final int period;

  GetViewedArticlesEvent({required this.period});
}
