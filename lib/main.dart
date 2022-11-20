import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/cubit/appCubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/wait.dart';
import 'package:color/color.dart';

void main()  async {
 WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (BuildContext context)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,  state) {  },
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
          return   MaterialApp(

            debugShowCheckedModeBanner: false,

            //light theme
            theme: ThemeData(
              primaryColor:Colors.white ,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                  size: 30.0,
                ),
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue[300],

                elevation: 0.0,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
                bodyText2: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0,
                    color: Colors.black
                ),
                headline6: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),

            //dark theme
            darkTheme:ThemeData(

              primaryColor:Colors.black ,
              scaffoldBackgroundColor:Colors.black,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 30.0,
                ),
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Colors.black,
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                selectedItemColor:Colors.blue[300],
                unselectedItemColor: Colors.white,
                elevation: 0.0,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
                bodyText2: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0,
                    color: Colors.white
                ),
                headline6: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),

            ),

            //toggele between
            themeMode:cubit.AppMode,
            home: NewsLayout(),
          );
        },



      ),
    );
  }
}
