import 'package:bloc/bloc.dart';
import 'package:news/core/cubit/states.dart';
import 'package:news/core/repository/repository.dart';
import '../../models/news_response_model.dart';
import '../../models/source_response_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  SourcesResponse? sourcesResponse;
  NewsResponse? newResponse;
  int selectedIndex = 0;
  HomeRepo repo;

  HomeCubit(this.repo) : super(InitHomeState());

  void changSelectedTab(int index) async {
    selectedIndex = index;
    await getNewsData();
    emit(ChangSelectedTabState());
  }

  void getSources(String categoryName) async {
    try {
      emit(GetSourceLoadingState());
      sourcesResponse = await repo.getSources(categoryName);
      if (sourcesResponse!.status == "ok") {
        await getNewsData();
        emit(GetSourceSuccessState());
      } else {
        emit(GetSourceErrorState());
      }
    } catch (error) {
      emit(GetSourceErrorState());
    }
  }

  Future<void> getNewsData() async {
    try {
      emit(GetNewsDataLoadingState());
      newResponse = await repo
          .getNewsData(sourcesResponse?.sources?[selectedIndex].id ?? "");
      // if (newResponse!.articles!.isEmpty) {
      //   emit(GetNewsDataEmptyState());
      // } else
      if (newResponse!.status == "ok") {
        emit(GetNewsDataSuccessState());
      } else {
        emit(GetNewsDataErrorState(newResponse!.message ?? ""));
      }
    } catch (error) {
      emit(GetNewsDataErrorState(newResponse!.message ?? ""));
    }
  }
}
