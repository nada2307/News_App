abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsBusLoadingState extends NewsStates {}

class NewsGetBusSucState extends NewsStates {}

class NewsGetBusErrorState extends NewsStates {
  final String error;

  NewsGetBusErrorState(this.error);
}

class NewsSportLoadingState extends NewsStates {}

class NewsGetSportSucState extends NewsStates {}

class NewsGetSportErrorState extends NewsStates {
  final String error;

  NewsGetSportErrorState(this.error);
}

class NewsScsLoadingState extends NewsStates {}

class NewsGetScsSucState extends NewsStates {}

class NewsGetScsErrorState extends NewsStates {
  final String error;

  NewsGetScsErrorState(this.error);
}

class NewsChangeModeState extends NewsStates {}