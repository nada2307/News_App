import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/models/business/business_screen.dart';
import 'package:news_app/models/science/science_screen.dart';
import 'package:news_app/models/setting/setting_screen.dart';
import 'package:news_app/models/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_esports_rounded),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNevBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSport();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBusLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', qury: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      business = value.data['articles'];
      //print(business[0]['title']);
      emit(NewsGetBusSucState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusErrorState(error));
    });
  }

  List<dynamic> sports = [];

  void getSport() {
    emit(NewsSportLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', qury: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        sports = value.data['articles'];
        //print(business[0]['title']);
        emit(NewsGetSportSucState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorState(error));
      });
    } else {
      emit(NewsGetSportSucState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsScsLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', qury: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        science = value.data['articles'];
        //print(business[0]['title']);
        emit(NewsGetScsSucState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScsErrorState(error));
      });
    } else {
      emit(NewsGetScsSucState());
    }
  }

  bool isDark = false;
  void changeMode (){
    isDark = !isDark;
    emit(NewsChangeModeState());
  }
}
