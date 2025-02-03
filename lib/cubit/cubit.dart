import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:http/http.dart' as http;
import '../api_maneger/constant_url.dart';
import '../models/news_response_model.dart';
import '../models/source_response_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  SourcesResponse? sourcesResponse;
  NewsResponse? newResponse;
  int selectedIndex = 0;

  HomeCubit() : super(InitHomeState());

  void changSelectedTab(int index) async {
    selectedIndex = index;
    await getNewsData();
    emit(ChangSelectedTabState());
  }

  void getSources(String categoryName) async {
    try {
      emit(GetSourceLoadingState());
      Uri baseUrl =
          Uri.https(ConstantUrl.baseUrl, "/v2/top-headlines/sources", {
        "apiKey": ConstantUrl.apiKey,
        "category": categoryName,
      });
      http.Response response = await http.get(baseUrl);
      var json = await jsonDecode(response.body);
      sourcesResponse = SourcesResponse.fromJson(json);
      await getNewsData();
      if (sourcesResponse!.status == "ok"){
      emit(GetSourceSuccessState());
      }else {
        emit(GetSourceErrorState());
      }
    } catch (error) {
      emit(GetSourceErrorState());
    }
  }

  Future<void> getNewsData() async {
    try {
      emit(GetNewsDataLoadingState());
      Uri baseUrl = Uri.https(
        ConstantUrl.baseUrl,
        "/v2/everything",
        {
          "apiKey": ConstantUrl.apiKey,
          "sources": sourcesResponse?.sources?[selectedIndex].id ?? "",
        },
      );
      http.Response response = await http.get(baseUrl);
      var json = await jsonDecode(response.body);
      newResponse = NewsResponse.fromJson(json);
      if (newResponse!.articles!.isEmpty) {
        emit(GetNewsDataEmptyState());
      } else if (newResponse!.status == "ok") {
        emit(GetNewsDataSuccessState());
      } else {
        emit(GetNewsDataErrorState(newResponse!.message ?? ""));
      }
    } catch (error) {
      emit(GetNewsDataErrorState(newResponse!.message ?? ""));
    }
  }
}
