import 'package:flutter/material.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data_dark.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeDataDark().textTheme;

    return Expanded(
      child: Center(
        child: Text(
          'No Results',
          style: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
