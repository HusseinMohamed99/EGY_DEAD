import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Center(
        child: Text(
          'noResults',
          style: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
