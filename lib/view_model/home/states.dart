class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetDataFromSpecificYearLoading extends HomeStates {}

class GetDataFromSpecificYearSuccess extends HomeStates {}

class GetSemesterDataLoading extends HomeStates {}

class GetSemesterDataSuccess extends HomeStates {}

class GetDataFromSpecificYearError extends HomeStates {
  String? message;
  GetDataFromSpecificYearError(this.message);
}

class SwitchSemester extends HomeStates {}
