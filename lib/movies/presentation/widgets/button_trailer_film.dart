part of './../../../core/helpers/export_manager/export_manager.dart';

class ButtonTrailerFilms extends StatelessWidget {
  const ButtonTrailerFilms({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 19.r,
      backgroundColor: ColorManager.primaryRedColor,
      child: IconButton(
        onPressed: () {
          urlLauncher(
            Uri.parse(
              moviesDetailsStates.moviesDetails?.trailerUrl ?? '',
            ),
          );
        },
        icon: Icon(
          Icons.play_circle,
          color: ColorManager.whiteColor,
          size: 24.sp,
        ),
      ),
    );
  }
}
