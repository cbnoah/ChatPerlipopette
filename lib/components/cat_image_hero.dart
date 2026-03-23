import 'package:flutter/material.dart';

class CatImageHero extends StatelessWidget {
  final String catId;
  final String imageRefId;

  const CatImageHero({required this.catId, required this.imageRefId});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: catId,
      child: ClipRect(
        child: Image.network(
          "https://cdn2.thecatapi.com/images/$imageRefId.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: 400,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Image.asset(
                  alignment: FractionalOffset.topCenter,
                  fit: BoxFit.cover,
                  'assets/images/image_error.png',
                );
              },
        ),
      ),
    );
  }
}

