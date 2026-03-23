import 'package:flutter/material.dart';

class CatCareAdviceSection extends StatelessWidget {
  const CatCareAdviceSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Conseils de soin',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 4,
              ),
            ),
          ),
          child: Text(
            'Un brossage hebdomadaire est essentiel pour éviter les nœuds dans leur fourrure dense. Pendant la mue, un brossage quotidien est recommandé.',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onInverseSurface,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

