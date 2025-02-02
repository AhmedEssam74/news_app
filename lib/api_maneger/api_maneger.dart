import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api_maneger/constant_url.dart';
import 'package:news/models/news_response_model.dart';
import 'package:news/models/source_response_model.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String categoryName) async {
    Uri baseUrl = Uri.https(ConstantUrl.baseUrl, "/v2/top-headlines/sources", {
      "apiKey": ConstantUrl.apiKey,
      "category": categoryName,
    });
    http.Response sourceResponse = await http.get(baseUrl);
    var json = await jsonDecode(sourceResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri baseUrl = Uri.https(
      ConstantUrl.baseUrl,
      "/v2/everything",
      {
        "apiKey": ConstantUrl.apiKey,
        "sources": sourceId,
      },
    );
    http.Response newsResponse = await http.get(baseUrl);
    var json = await jsonDecode(newsResponse.body);
    NewsResponse newResponse = NewsResponse.fromJson(json);
    return newResponse;
  }

// static Future<SourcesResponse> getCategories(String category) async {
//   Uri baseUrl = Uri.https(
//     "newsapi.org",
//     "/v2/top-headlines/sources",
//     {
//       "apiKey": "32ebe2ff13054686bb17c7cc7eb717e2",
//       "category": category,
//     },
//   );
//   http.Response categoriesResponse = await http.get(baseUrl);
//   var json = await jsonDecode(categoriesResponse.body);
//   SourcesResponse categoryResponse = SourcesResponse.fromJson(json);
//   return categoryResponse;
// }
}
