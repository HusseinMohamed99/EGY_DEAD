part of './../../../core/helpers/export_manager/export_manager.dart';

class ShowRecommendations extends StatelessWidget {
  const ShowRecommendations({
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
          AppString.recommendations,
          style: TextStyleManager.titleSmall(context: context),
        ),
        const Space(height: 8, width: 0),
        const MovieRecommendationsBlocBuilder(),
      ],
    );
  }
}

class MovieRecommendationsBlocBuilder extends StatelessWidget {
  const MovieRecommendationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        if (state.moviesRecommendationStates == RequestState.loading) {
          return MoviesRecommendationListView(
            moviesDetailsStates: state,
          ).skeletonize();
        } else if (state.moviesRecommendationStates == RequestState.loaded) {
          return MoviesRecommendationListView(
            moviesDetailsStates: state,
          );
        } else {
          return BuildErrorMessage(
            errorMessage: state.moviesRecommendationMessage,
          );
        }
      },
    );
  }
}

class MoviesRecommendationListView extends StatelessWidget {
  const MoviesRecommendationListView({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;
  @override
  Widget build(BuildContext context) {
    return HorizontalListView(
      padding: EdgeInsets.only(right: 8.w),
      itemBuilder: (context, index) {
        final recommendation = moviesDetailsStates.moviesRecommendation[index];
        return ContentDisplayCard(
          navigateToDetailsSection: () {
            navigateToDetailsSection(context, recommendation.id);
          },
          imageUrl: ApiConstance.imageURL(recommendation.backdropPath ?? ''),
        );
      },
      itemCount: moviesDetailsStates.moviesRecommendation.length,
    );
  }
}
