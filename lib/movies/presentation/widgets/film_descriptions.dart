part of './../../../core/helpers/export_manager/export_manager.dart';

class FilmDescription extends StatelessWidget {
  const FilmDescription({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PosterPathWidget(
              moviesDetailsStates: moviesDetailsStates,
            ),
            Space(height: 0, width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonTrailerFilms(
                    moviesDetailsStates: moviesDetailsStates,
                  ),
                  Space(height: 16, width: 0),
                  Text(
                    moviesDetailsStates.moviesDetails?.title ?? '',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                  Space(height: 16, width: 0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.charCoolColor,
                            borderRadius: BorderRadius.circular(4.0).r,
                          ),
                          child: Text(
                            moviesDetailsStates.moviesDetails?.releaseDate
                                    .split('-')[0] ??
                                "",
                            style: context.textTheme.labelMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Space(height: 0, width: 8),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorManager.iconRateColor,
                              size: 24.sp,
                            ),
                            Text(
                              moviesDetailsStates.moviesDetails?.voteAverage
                                      .toStringAsFixed(1) ??
                                  '',
                              style: context.textTheme.labelMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Space(height: 0, width: 8),
                      Expanded(
                        child: Text(
                          _showDuration(
                              moviesDetailsStates.moviesDetails?.runtime ?? 0),
                          style: context.textTheme.labelMedium!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Space(height: 16.h, width: 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              moviesDetailsStates.moviesDetails?.overview ?? "",
              style: context.textTheme.titleSmall,
            ),
            Space(height: 8.h, width: 0),
            Text.rich(
              TextSpan(
                text: "${AppString.genres}: ",
                style: context.textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: _showGenres(
                      moviesDetailsStates.moviesDetails?.genres ?? [],
                    ),
                    style: context.textTheme.labelSmall!.copyWith(
                      color: ColorManager.primaryRedColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
