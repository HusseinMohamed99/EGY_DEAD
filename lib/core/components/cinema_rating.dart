part of '../helpers/export_manager/export_manager.dart';

class CinemaRating extends StatelessWidget {
  const CinemaRating({super.key, required this.rate});

  final String? rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: ColorManager.iconRateColor, size: 24.sp),
        Text(
          rate ?? '',
          style: context.textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
