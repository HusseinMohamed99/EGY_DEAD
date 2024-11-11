part of './../../../core/helpers/export_manager/export_manager.dart';

class PosterPathWidget extends StatelessWidget {
  const PosterPathWidget({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(
          color: ColorManager.primaryGreenColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10).r,
        child: CachedImage(
          boxFit: BoxFit.fill,
          imageUrl: ApiConstance.imageURL(
            moviesDetailsStates.moviesDetails?.posterPath ?? '',
          ),
          width: 120.w,
          height: 150.h,
        ),
      ),
    );
  }
}
