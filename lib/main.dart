// @dart=2.9

// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/news_app_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/states.dart';

void main() {
  DioHelper.init();
  // Bloc.observer = MyBlocObserver();
  //BlocOverrides.runZoned(
  //    () {
  // Use cubits...
  //},
  //blocObserver: MyBlocObserver(),
  //);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              color: Colors.deepPurpleAccent,
              theme: ThemeData(
                primaryColorLight: Colors.deepPurpleAccent,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      //systemNavigationBarIconBrightness: ,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurpleAccent,
                  elevation: 15.0,
                ),
                primaryColor: Colors.deepPurpleAccent,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primaryColorLight: Colors.deepPurpleAccent,
                scaffoldBackgroundColor: Colors.black54,
                appBarTheme: const AppBarTheme(
                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black45,
                      //systemNavigationBarIconBrightness: ,
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black45,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black54,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurpleAccent,
                  unselectedItemColor: Colors.white60,
                  elevation: 15.0,
                ),
                primaryColor: Colors.deepPurpleAccent,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: const Directionality(
                  textDirection: TextDirection.rtl, child: NewsLayout()),
            );
          }),
    );
  }
}
