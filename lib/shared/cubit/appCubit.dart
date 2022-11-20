import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isDark = true;
  ThemeMode AppMode = ThemeMode.light;

  void changeAppMode(){
    if(isDark){
      AppMode =ThemeMode.light;
    }
    if(!isDark){
      AppMode = ThemeMode.dark;
    }
    isDark = !isDark ;
    CacheHelper.setData(key: 'isDark', value: isDark).then((value){
      emit(ChangeAppModeState());
    });
  }
}

