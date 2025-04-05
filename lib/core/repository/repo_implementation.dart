import 'dart:convert';
import 'package:news/core/repository/repository.dart';
import 'package:news/models/source_response_model.dart';
import 'package:http/http.dart' as http;
import '../../api_maneger/constant_url.dart';
import '../../models/news_response_model.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<NewsResponse> getNewsData(String sourceId) async {
    Uri baseUrl = Uri.https(
      ConstantUrl.baseUrl,
      "/v2/everything",
      {
        "apiKey": ConstantUrl.apiKey,
        "sources": sourceId,
      },
    );
    http.Response response = await http.get(baseUrl);
    var json = await jsonDecode(response.body);
    NewsResponse newResponse = NewsResponse.fromJson(json);
    return newResponse;
  }

  @override
  Future<SourcesResponse> getSources(String categoryName) async {
    Uri baseUrl = Uri.https(ConstantUrl.baseUrl, "/v2/top-headlines/sources", {
      "apiKey": ConstantUrl.apiKey,
      "category": categoryName,
    });
    http.Response response = await http.get(baseUrl);
    var json = await jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  @override
  Future<NewsResponse> getSearchData(String itemName) async {
    Uri baseUrl = Uri.https(
      ConstantUrl.baseUrl,
      "/v2/everything",
      {
        "apiKey": ConstantUrl.apiKey,
        "q": itemName,
        // "sources": itemName.isEmpty ? "abc-news" : null,
      },
    );
    http.Response response = await http.get(baseUrl);
    var json = await jsonDecode(response.body);
    NewsResponse newResponse = NewsResponse.fromJson(json);
    return newResponse;
  }
}
