part of './../../../core/helpers/export_manager/export_manager.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
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
