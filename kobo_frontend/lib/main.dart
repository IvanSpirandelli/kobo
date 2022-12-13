import 'package:flutter/material.dart';
import 'package:kobo_frontend/widgets/front_page_layout.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'KoBo',
      debugShowCheckedModeBanner: false,
      home: FrontPageLayout(),
    );
  }
}


