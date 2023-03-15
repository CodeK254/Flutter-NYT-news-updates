// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nyt/newsPage.dart'; 

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => newsPage(),
    },
  ));
}