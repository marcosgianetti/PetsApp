import 'package:flutter/material.dart';
import 'package:pets_app/ui/components/compnents.dart';

class ImageFromAPI extends StatelessWidget {
  const ImageFromAPI({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      errorBuilder: (context, error, stackTrace) {
        return const Text(
          '😢',
          style: TextStyle(fontSize: 32),
        );
      },
      fit: BoxFit.scaleDown,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicatorApp(),
          );
        }
      },
    );
  }
}
