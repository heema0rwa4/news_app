import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/cubit/appCubit.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          var cubita = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
                style: TextStyle(),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                    )),
                IconButton(
                    onPressed: () {

                      cubita.changeAppMode();

                    },
                    icon: Icon(
                      cubita.isDark? Icons.dark_mode_outlined: Icons.light_mode,
                    )),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: cubit.bottomNavItem,
            ),
          );
        },
      ),
    );
  }
}
