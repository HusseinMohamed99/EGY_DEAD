part of './../../../core/helpers/export_manager/export_manager.dart';

class ShowCast extends StatelessWidget {
  const ShowCast({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.cast,
          style: context.textTheme.titleMedium,
        ),
        Space(height: 8, width: 0),
        ShowCastForMovies(moviesDetailsStates.moviesDetails?.cast),
      ],
    );
  }
}

class ShowCastForMovies extends StatelessWidget {
  const ShowCastForMovies(this.cast, {super.key});
  final List<Cast>? cast;
  @override
  Widget build(BuildContext context) {
    return (cast?.isNotEmpty ?? false)
        ? SectionCastOrReviewsListView(
            height: 140.h,
            itemCount: cast!.length,
            itemBuilder: (context, index) => CastCard(
              cast: cast?[index] ??
                  Cast(
                    name: '',
                    profileUrl: '',
                    gender: 0,
                  ),
            ),
          )
        : NoDataFoundWidget(
            message: 'No cast found.',
            imagePath: Assets.imagesNoData,
          );
  }
}
