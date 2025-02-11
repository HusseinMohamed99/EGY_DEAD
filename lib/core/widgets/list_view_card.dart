part of '../helpers/export_manager/export_manager.dart';

class HorizontalListViewCard extends StatelessWidget {
  const HorizontalListViewCard({
    super.key,
    required this.movies,
  });

  final Movies? movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(8.0).r),
        border: Border.all(
          color: ColorManager.whiteColor,
          width: 1.0,
        ),
      ),
      child: InkWell(
        onTap: () {
          navigateToDetailsSection(context, movies?.id ?? 0);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
          child: CachedImage(
            boxFit: BoxFit.fitHeight,
            imageUrl: ApiConstance.imageURL(movies?.backdropPath ?? ''),
            width: 120.w,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
