import 'package:flutter/material.dart';

class ArticleText extends StatelessWidget {
  const ArticleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        decoration: TextDecoration.none,
        color: Colors.black
        )
      );
  }
}