import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed/cache_helper.dart';
import 'package:news_feed/logic/cubit.dart';
import 'package:news_feed/logic/web_services.dart';
import 'package:news_feed/pages/home.dart';
import 'package:news_feed/themes.dart';

import 'logic/states.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  WebServices.init();
 bool? isDark=CacheHelper.getData(key: 'isDark')??false;
  runApp(  MyApp(isDark: isDark!,));
}

class MyApp extends StatelessWidget {
  bool? isDark;
    MyApp({super.key,required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider( create: (context)=>AppCubit()..changeTheme(fromShared: isDark!),),
      BlocProvider( create: (context)=>AppCubit()..getBusiness() )

    ],
    child: BlocConsumer<AppCubit,InitialState>(listener: (context,state){},builder: (context,state){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ahmed news',
        themeMode:AppCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
        theme:lightTheme,
        darkTheme: darkTheme,
        home: const HomeScreen(),
      );

    })
    );
  }
}
