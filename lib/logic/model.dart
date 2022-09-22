class News {
  late  String publishedAt;
  late  String title;
  late  String url;

  late  String urlToImage;

  News({required this.title,required this.publishedAt,required this.url,required this.urlToImage});

    News.fromJson(Map<String,dynamic> json){
      publishedAt=json['publishedAt'];
      url =json['url'];

      urlToImage=json['urlToImage'];
      title=json['title'] ;}

}