import 'package:flutter/widgets.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({super.key, required this.imageUrl});
  
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 512,
      width: 512,);
  }
}