import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/enum/enum.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
    return Expanded(
      child: Center(
        child: Text(
          'Search Text',
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
