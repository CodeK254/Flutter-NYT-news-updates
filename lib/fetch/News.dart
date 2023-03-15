// ignore_for_file: avoid_print, avoid_returning_null_for_void, unused_local_variable, non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'dart:convert';
//oop class entity 
class News{
  String? source;
  String? title;
  String? url;
  String? image_url;
  String? description;
  String? published;
  String? content;

  News({this.source,this.title,this.url,this.image_url,this.description,this.published,this.content});

  News.fromJson(Map json):
    source=json['source']['name'],
    title=json['title'],
    url=json['url'],
    image_url = json['urlToImage'],
    description = json['description'],
    published = json['publishedAt'],
    content = json['content'];
}

fetchNewsFunc() async {
  try{
  Response response = await get(Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&apiKey=2b3c34d8bafc4b21a0fa19e67ae7244b'));
  Map data = jsonDecode(response.body);

  var d=data['articles'].map((article)=>News.fromJson(article)).toList();
  
  print("loading");
  print(data['totalResults']);
  int count = data['totalResults'];

  // status = data['status'];
  // articles = data['articles'];
  // totalResults = data['totalResults'];
  return d;

  }catch(e) {
    print(e);
    return [];
  }
}