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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PosterPathWidget(posterImage: state.tvsDetails?.posterPath ?? ''),
        Space(width: 16, height: 0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WatchTrailerButton(
                trailerUrl: state.tvsDetails?.trailerUrl ?? '',
              ),
              Space(height: 16, width: 0),
              CinemaTitle(title: state.tvsDetails?.name ?? ''),
              Space(height: 16, width: 0),
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
