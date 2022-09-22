import 'package:flutter/material.dart';
import 'package:news_feed/web_view/web_view.dart';

Widget buildArticleItem({required double h,required article,required context}) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(

          builder: (context)=>article['url']!=null?
          WebViewScreen(url: article['url']):const CircleAvatar()));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          article['urlToImage']!=null?   Container(
            height:h,
            width: h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10)
            ),
          ): Container(
            height:h,
            width: h,
            child: const Center(child: Text('not found')),
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10)
            ),
          ),const SizedBox(width: 10,),
          Expanded(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  // ,maxLines: 4,overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10,),
                Text('${article['publishedAt']}',
                  style: Theme.of(context).textTheme.bodyText1,),

              ],),
          )
        ],),
    ),
  );
}
