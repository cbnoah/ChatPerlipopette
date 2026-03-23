import 'package:flutter/material.dart';

class IntroductionSection extends StatelessWidget {
  final BuildContext context;

  const IntroductionSection({required this.context});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Trouvez le compagnon idéal selon votre style de vie.',
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontSize: 15,
      ),
    );
  }
}

