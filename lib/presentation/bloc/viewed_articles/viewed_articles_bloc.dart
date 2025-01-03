import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/models/viewed_article.dart';
import 'package:news_app/domain/repository/most_viewed_repository.dart';

part 'viewed_articles_event.dart';
part 'viewed_articles_state.dart';

class ViewedArticlesBloc extends Bloc<ViewedArticlesEvent, ViewedArticlesState> {
  final MostViewedRepository _repository;

  ViewedArticlesBloc(this._repository) : super(ViewedArticlesInitial()) {
    on<GetViewedArticlesEvent>(_onGetArticles);
  }

  _onGetArticles(GetViewedArticlesEvent event, Emitter<ViewedArticlesState> emit) async {
    print("loaidng");
    emit(ViewedArticlesLoading());

    final res = await _repository.getArticles(event.period);

    res.fold(
      (l) {
        emit(ViewedArticlesFailed(l));
      },
      (r) {
        emit(ViewedArticlesSuccess(articles: r));
      },
    );
  }
}
