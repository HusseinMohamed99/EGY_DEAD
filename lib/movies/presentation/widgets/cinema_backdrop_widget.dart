part of './../../../core/helpers/export_manager/export_manager.dart';

class CinemaBackdropWidget extends StatelessWidget {
  const CinemaBackdropWidget({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return CachedImage(
      imageUrl: ApiConstance.imageURL(
          moviesDetailsStates.moviesDetails?.backdropPath ?? ''),
      width: double.infinity,
      height: 200.h,
      boxFit: BoxFit.fitHeight,
    );
  }
}
