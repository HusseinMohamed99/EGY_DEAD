part of '../helpers/export_manager/export_manager.dart';

class CinemaRating extends StatelessWidget {
  const CinemaRating({super.key, required this.rate});

  final String? rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: ColorManager.iconRateColor, size: 20.sp),
        Text(
          rate ?? '',
          style: TextStyleManager.labelMedium(context: context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
