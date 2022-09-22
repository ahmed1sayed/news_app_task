import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit.dart';
import '../logic/states.dart';
import '../widgets.dart';
class SportScreen extends StatefulWidget {
  const SportScreen({Key? key}) : super(key: key);


  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery
        .of(context)
        .size
        .width;
    return BlocConsumer<AppCubit, InitialState>(builder: (context, state) {
      var list = AppCubit
          .get(context)
          .sports;
      return    list.isEmpty?
      const Center(
          child: CircularProgressIndicator()
      ):

      ListView.separated(itemBuilder: (context, index) {
        return buildArticleItem(h: appWidth * .33, article: list[index],context: context);
      },
          separatorBuilder: (context, index) {
            return const Divider(height: 1, color: Colors.grey,);
          },
          itemCount: list.length) ;




    }, listener: (context, state) {},);
  }
}
