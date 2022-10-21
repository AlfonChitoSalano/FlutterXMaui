import 'package:flutter/material.dart';
import '../infra/bloc/article_list_bloc.dart';
import '../infra/bloc/bloc_provider.dart';
import '../models/article.dart';
import 'article_list_item.dart';

class BlocPatternPage extends StatelessWidget {
  final bloc = ArticleListBloc();

  BlocPatternPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleListBloc>(
        bloc: bloc,
        child: Scaffold(
          appBar: AppBar(title: const Text('Articles')),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search ...',
                  ),
                  onChanged: bloc.searchQuery.add,
                ),
              ),
              Expanded(
                child: _buildResults(bloc),
              )
            ],
          ),
        ));
  }

  Widget _buildResults(ArticleListBloc bloc) {
    return StreamBuilder<List<Article>?>(
      stream: bloc.articlesStream,
      builder: (context, snapshot) {
        final results = snapshot.data;

        if (results == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (results.isEmpty) {
          return const Center(child: Text('No Results'));
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Article> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ArticleListItem(article: article),
          ),
          onTap: () {
            const snackBar = SnackBar(
              content: Text('will open the article details soon'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        );
      },
    );
  }
}
