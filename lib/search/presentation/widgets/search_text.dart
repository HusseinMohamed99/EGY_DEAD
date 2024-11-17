part of './../../../core/helpers/export_manager/export_manager.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'Search Text',
          style: context.textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
