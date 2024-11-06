part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildRating extends StatelessWidget {
  const BuildRating({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: ColorManager.iconRateColor,
          size: 20.sp,
        ),
        Space(width: 4, height: 0),
        Text(
          rating.toStringAsFixed(1),
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
