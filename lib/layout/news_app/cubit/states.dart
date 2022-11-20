import 'package:news_app/layout/news_app/cubit/states.dart';

abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

//Business
class GetBusinessNewsSuccessState extends NewsStates {}

class GetBusinessNewsLoadingState extends NewsStates {}

class GetBusinessNewsFailureState extends NewsStates {
  final String error;

  GetBusinessNewsFailureState(this.error);
}

//Sports
class GetSportsNewsSuccessState extends NewsStates {}

class GetSportsNewsLoadingState extends NewsStates {}

class GetSportsNewsFailureState extends NewsStates {
  final String error;

  GetSportsNewsFailureState(this.error);
}

//science
class GetScienceNewsSuccessState extends NewsStates {}

class GetScienceNewsLoadingState extends NewsStates {}

class GetScienceNewsFailureState extends NewsStates {
  final String error;

  GetScienceNewsFailureState(this.error);
}

//general
class GetGeneralNewsSuccessState extends NewsStates {}

class GetGeneralNewsLoadingState extends NewsStates {}

class GetGeneralNewsFailureState extends NewsStates {
  final String error;

  GetGeneralNewsFailureState(this.error);
}

