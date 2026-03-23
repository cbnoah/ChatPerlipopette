import 'package:flutter/material.dart';
import '../utils/cat.dart';

class CatHeaderSection extends StatelessWidget {
  final Cat cat;

  const CatHeaderSection({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cat.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFFFF9500), size: 18),
                  SizedBox(width: 5),
                  Text(
                    cat.origin,
                    style: TextStyle(color: Color(0xFFFF9500), fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        Icon(Icons.favorite_border, color: Color(0xFFFF9500), size: 28),
      ],
    );
  }
}

