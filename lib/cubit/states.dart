abstract class HomeStates {}

class InitHomeState extends HomeStates {}

class GetSourceLoadingState extends HomeStates {}

class GetSourceSuccessState extends HomeStates {}

class GetSourceErrorState extends HomeStates {
  // String? errorMessage;
  //
  // GetSourceErrorState(this.errorMessage);
}

class GetSourceEmptyState extends HomeStates {}

class GetNewsDataLoadingState extends HomeStates {}

class GetNewsDataSuccessState extends HomeStates {}

class GetNewsDataErrorState extends HomeStates {
  String? errorMessage;

  GetNewsDataErrorState(this.errorMessage);
}

class GetNewsDataEmptyState extends HomeStates {}

class ChangSelectedTabState extends HomeStates {}
