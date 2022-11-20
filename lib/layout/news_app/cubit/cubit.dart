import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sport/sport_screen.dart';
import 'package:news_app/modules/general/general_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<BottomNavigationBarItem> bottomNavItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business_center_sharp,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_soccer,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science_sharp,
        ),
        label: 'Science'),
    BottomNavigationBarItem(
        icon: Icon(

          Icons.home,

        ),
        label: 'General'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SciencsScreen(),
    GeneralScreen(),
  ];

  void changeBottomNav(int index) {

    currentIndex = index;
    if (index == 1) {
      getSportsData();
    }
    if (index == 2) {
      getScienceData();
    }
    if (index == 3) {
      getGeneralData();
    }
    emit(NewsBottomNavStates());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> general = [];


  void getBusinessData() {
    emit(GetBusinessNewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'ae',
        'category': 'business',
        'apiKey': 'e00306ac48a247469541e8b128e14262',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[2]['title']);
      emit(GetBusinessNewsSuccessState());
    }).catchError((error) {
      print('Error happend at ${error.toString()}');
      emit(GetBusinessNewsFailureState(error.toString()));
    });
  }

  void getSportsData() {
    emit(GetSportsNewsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'ae',
          'category': 'sports',
          'apiKey': 'e00306ac48a247469541e8b128e14262',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[2]['title']);
        emit(GetSportsNewsSuccessState());
      }).catchError((error) {
        print('Error happend at ${error.toString()}');
        emit(GetSportsNewsFailureState(error.toString()));
      });
    } else {
      emit(GetSportsNewsSuccessState());
    }
  }

  void getScienceData() {
    emit(GetScienceNewsLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'ae',
          'category': 'science',
          'apiKey': 'e00306ac48a247469541e8b128e14262',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[2]['title']);
        emit(GetScienceNewsSuccessState());
      }).catchError((error) {
        print('Error happend at ${error.toString()}');
        emit(GetScienceNewsFailureState(error.toString()));
      });
    } else {
      emit(GetScienceNewsSuccessState());
    }
  }

  void getGeneralData() {
    emit(GetGeneralNewsLoadingState());
    if (general.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'ae',
          'category': 'general',
          'apiKey': 'e00306ac48a247469541e8b128e14262',
        },
      ).then((value) {
        general = value.data['articles'];
        print(general[2]['title']);
        emit(GetGeneralNewsSuccessState());
      }).catchError((error) {
        print('Error happend at ${error.toString()}');
        emit(GetGeneralNewsFailureState(error.toString()));
      });
    } else {
      emit(GetGeneralNewsSuccessState());
    }
  }

}
