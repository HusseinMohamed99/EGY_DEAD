part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildReleaseDateChip extends StatelessWidget {
  const BuildReleaseDateChip({super.key, required this.releaseDate});
  final String releaseDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: ColorManager.primaryRedColor,
        borderRadius: BorderRadius.circular(4.0).r,
      ),
      child: Text(
        releaseDate.split('-')[0],
        style: context.textTheme.labelSmall,
      ),
    );
  }
}
