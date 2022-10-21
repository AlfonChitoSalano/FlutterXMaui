import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../models/article.dart';
import '../dependency_services/rest_client.dart';
import 'bloc_base.dart';

class ArticleListBloc implements Bloc {
  final _client = RestClient();
  final _searchQueryController = StreamController<String?>();

  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {
    articlesStream = _searchQueryController.stream
        .startWith(null)
        .debounceTime(const Duration(milliseconds: 100))
        .switchMap(
            (query) => _client.fetchArticles(query).asStream().startWith(null));
  }

  @override
  void dispose() {
    _searchQueryController.close();
  }
}
