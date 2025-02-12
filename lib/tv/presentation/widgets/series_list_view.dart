part of '../../../core/helpers/export_manager/export_manager.dart';

class SeriesListView extends StatelessWidget {
  const SeriesListView(
      {super.key, required this.itemCount, required this.itemBuilder});
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) => const Space(height: 20, width: 0),
    );
  }
}
