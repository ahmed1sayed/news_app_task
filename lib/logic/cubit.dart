import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed/logic/end_points.dart';
import 'package:news_feed/logic/states.dart';
import 'package:news_feed/logic/web_services.dart';

import '../cache_helper.dart';
import '../pages/bisness.dart';
import '../pages/sience.dart';
import '../pages/sport.dart';

class AppCubit extends Cubit<InitialState>{
  AppCubit():super(NewsInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  //todo الجزء بتاع التنقل في النفيجيتور بار
  int currentindex=0;
  List screens= [
    const BisnessScreen(),
    const SportScreen(),
    const ScienceScreen(),
    // const SettingsScreen(),
  ];

  List<BottomNavigationBarItem>bottomItems=[
    const BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sport'),
    const BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
    //  const BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
  ];
  //todo تعبئة الجيت بتاعت الدايو
  List<dynamic>business=[];
  List<dynamic>sports=[];
  List<dynamic>science=[];
  List<dynamic>search=[];

  void getBusiness()async{
    await
    WebServices().getData(url: 'v2/top-headlines', query: {
      "country":"eg",
      'category':'business',
      'apiKey':apiKey,

    }).then((value) {

      business=value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){

      // ignore: avoid_print
      print(error.toString());
      emit(NewsBusinessErrorState(error: error.toString()));
    });

  }
  void getSport()async{

    await WebServices().getData(url: 'v2/top-headlines', query: {
      "country":"eg",
      'category':'sports',
      'apiKey':apiKey,

    }).then((value) {

      sports=value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){

      // ignore: avoid_print
      print(error.toString());
      emit(NewsSportsErrorState(error: error.toString()));
    });

  }
  void getScience()async{
    await
    WebServices().getData(url: 'v2/top-headlines', query: {
      "country":"eg",
      'category':'science',
      'apiKey':apiKey,

    }).then((value) {

      science=value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){

      // ignore: avoid_print
      print(error.toString());
      emit(NewsScienceErrorState(error: error.toString()));
    });

  }
  //todo  الجيت بتاعت ليستة السيرش
  void getSearch({String ? value})async{
    emit(NewsGetSearchLoadingState());
    WebServices().getData(url: 'v2/top-headlines',
        query: {
          "q":"$value",

          'apiKey':apiKey,

        }).then((value) {

      search=value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){

      // ignore: avoid_print
      print(error.toString());
      emit(NewsSearchErrorState(error: error.toString()));
    }); }


  //todo  الزراير المتغيرة

  void changeBottomNavBar(int index)async{
      currentindex =index;
    if(index==0) {
      getBusiness();
    }
    if(index==1) {
      getSport();
     }
    if(index==2) {
      getScience();
    }
    emit(NewsBottomBarState());
  }



 late bool isDark=false;
  void changeTheme({bool? fromShared}) {
    if(fromShared !=null){  isDark=fromShared;

    emit(ChangeBottomNavBarState());
    }
    else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeBottomNavBarState());
      });
    }
  }
}
/*
echo "# news_app_task" >> README.md
git init
git add README.
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/ahmed1sayed/news_app_task.git
git push -u origin main
*/