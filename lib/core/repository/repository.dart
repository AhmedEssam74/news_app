import 'package:news/models/news_response_model.dart';
import 'package:news/models/source_response_model.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSources(String categoryName);
  Future<NewsResponse> getNewsData(String sourceId);
  Future<NewsResponse> getSearchData(String itemName);
}

