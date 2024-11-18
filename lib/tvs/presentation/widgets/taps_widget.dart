part of './../../../core/helpers/export_manager/export_manager.dart';

class TapsWidget extends StatelessWidget {
  const TapsWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: context.textTheme.labelSmall,
      ),
    );
  }
}
