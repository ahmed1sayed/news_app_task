import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed/logic/cubit.dart';
import 'package:news_feed/logic/states.dart';

import '../search/search.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,InitialState>(builder: (context,state){
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ( ){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));

              }, icon: const Icon(Icons.search)),
            IconButton(onPressed: ( ){AppCubit.get(context).changeTheme( );}, icon: const Icon(Icons.brightness_4_outlined))],
          title:  const Text('News App'),

        ),
        body: AppCubit.get(context).screens[AppCubit.get(context).currentindex],
        bottomNavigationBar: BottomNavigationBar(items: AppCubit.get(context).bottomItems,
          currentIndex:AppCubit.get(context).currentindex,
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          onTap: (index) {

            AppCubit.get(context).changeBottomNavBar(index);
          },
        ),
      );

    }, listener: (context,state){});
  }
}
