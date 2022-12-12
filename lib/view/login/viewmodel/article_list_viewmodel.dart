import 'package:flutter/cupertino.dart';

import '../service/news_service.dart';
import 'article_viewmodel.dart';

enum Status {initial, loading, loaded}
class ArticleListViewModel extends ChangeNotifier {
  ArticleViewModel viewModel = ArticleViewModel('general', []);
  Status status = Status.initial;

  ArticleListViewModel() {
    getNews('general');
  }


  Future <void> getNews(String category) async {
    status = Status.loading;
    notifyListeners();
    viewModel.articles = await NewsService().fetchNews(category);
    status = Status.loaded;
    notifyListeners();

  }
}