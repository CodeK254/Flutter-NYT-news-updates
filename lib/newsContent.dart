// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nyt/fetch/News.dart';

class Content extends StatefulWidget {

  final News instance;

  Content({required this.instance});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: Colors.teal,
        title: Text(
          widget.instance.source!,
        ),
      ),
      body: Center(
        widthFactor: 90,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.95,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
              widget.instance.title!,
                style: TextStyle(
                  fontFamily: 'MeriendaOne',
                  fontSize: 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              Text(
                widget.instance.description!,
                style: TextStyle(
                  fontFamily: 'MeriendaOne',
                  fontSize: 12,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.instance.image_url!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.instance.content!,
                style: TextStyle(
                  fontFamily: 'MeriendaOne',
                  fontSize: 12,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 20),
              SelectableText(
                widget.instance.url!,
                style: TextStyle(
                  fontFamily: 'MeriendaOne',
                  fontSize: 12,
                  letterSpacing: 1.5,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}