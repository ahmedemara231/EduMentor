class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetDataFromSpecificYearLoading extends HomeStates {}

class GetDataFromSpecificYearSuccess extends HomeStates {}

class GetDataFromSpecificYearError extends HomeStates {
  String? message;
  GetDataFromSpecificYearError(this.message);
}
