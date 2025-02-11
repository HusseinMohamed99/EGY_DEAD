part of './../../../core/helpers/export_manager/export_manager.dart';

class SeriesInfoRow extends StatelessWidget {
  const SeriesInfoRow({
    super.key,
    required this.state,
  });

  final TvsDetailsStates state;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PosterPathWidget(posterImage: state.tvsDetails?.posterPath ?? ''),
        Expanded(
          child: Column(
            spacing: 16.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WatchTrailerButton(
                trailerUrl: state.tvsDetails?.trailerUrl ?? '',
              ),
              CinemaTitle(title: state.tvsDetails?.name ?? ''),
              CinemaAttributes(
                releaseDate: state.tvsDetails?.firstDate.split('-')[0] ?? '',
                rate: state.tvsDetails?.voteAverage.toStringAsFixed(1) ?? '',
                duration: state.tvsDetails?.runtime is List
                    ? (state.tvsDetails?.runtime.isNotEmpty == true
                        ? state.tvsDetails?.runtime[0]
                        : 0)
                    : (state.tvsDetails?.runtime ?? 0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
