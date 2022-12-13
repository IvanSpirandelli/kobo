import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:kobo_frontend/utils/endpoints.dart';
import 'package:kobo_frontend/widgets/article_image.dart';
import 'package:kobo_frontend/widgets/article_text.dart';
import 'package:kobo_frontend/widgets/article_nav_bar.dart';

class FrontPageLayout extends StatefulWidget {
  const FrontPageLayout({super.key});

  @override
  State<FrontPageLayout> createState() => _FrontPageLayoutState();
}

class _FrontPageLayoutState extends State<FrontPageLayout> {
  int current = -1;
  String imageUrl = 'https://picsum.photos/250?image=9';
  String text = 'MacBooks are Laptops.\n \nLaptops can be carried!\n \nWhat can be carried can be stolen!';

  @override
  void initState() {
    getLatest();
    super.initState();
  }

  Future<void> getLatest() async{
    try {
      var res = await http.get(Uri.parse('${Endpoints.articles}/latest'));
      setStateByBody(jsonDecode(res.body));
    } catch (e){
      rethrow;
    }
  }

  Future<void> getNext() async{
    try {
      var res = await http.get(Uri.parse('${Endpoints.articles}/next/$current'));
      setStateByBody(jsonDecode(res.body));
    } catch (e){
      rethrow;
    }
  }

  Future<void> getPrevious() async{
    try {
      var res = await http.get(Uri.parse('${Endpoints.articles}/previous/$current'));
      setStateByBody(jsonDecode(res.body));
    } catch (e){
      rethrow;
    }
  }

  void setStateByBody(jsonBody){
    setState(() {
        current = jsonBody["id"];
        imageUrl = jsonBody["image"];
        text = jsonBody["text"];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 512,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ArticleImage(imageUrl: imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ArticleNavBar(getNext: getNext, getPrevious: getPrevious, getLatest: getLatest),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ArticleText(text: text),
            )
          ],
        ),
      ),
    );
  }
}