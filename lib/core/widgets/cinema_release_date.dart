part of '../helpers/export_manager/export_manager.dart';

class CinemaReleaseDate extends StatelessWidget {
  const CinemaReleaseDate({super.key, required this.releaseDate});

  final String? releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: ColorManager.charCoolColor,
        borderRadius: BorderRadius.circular(4.0).r,
      ),
      child: Text(
        releaseDate ?? '',
        style: TextStyleManager.labelSmall(context: context),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
