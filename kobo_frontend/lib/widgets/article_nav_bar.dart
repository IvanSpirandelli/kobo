import 'package:flutter/material.dart';

class ArticleNavBar extends StatelessWidget {
  const ArticleNavBar({super.key, required this.getNext, required this.getPrevious, required this.getLatest});

  final VoidCallback getNext;
  final VoidCallback getPrevious;
  final VoidCallback getLatest;

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () => getPrevious(),
                      child: const Text('Previous'),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () => getLatest(),
                      child: const Text('Latest'),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () => getNext(),
                      child: const Text('Next'),
                    ),
                )
              ],
            );
  }
}