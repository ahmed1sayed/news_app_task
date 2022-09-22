import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed/logic/states.dart';

import '../logic/cubit.dart';
import '../widgets.dart';
class BisnessScreen extends StatefulWidget {
  const BisnessScreen({Key? key}) : super(key: key);

  @override
  State<BisnessScreen> createState() => _BisnessScreenState();
}

class _BisnessScreenState extends State<BisnessScreen> {
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery
        .of(context)
        .size
        .width;
    return BlocConsumer<AppCubit, InitialState>(builder: (context, state) {
      var list = AppCubit
          .get(context)
          .business;
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
