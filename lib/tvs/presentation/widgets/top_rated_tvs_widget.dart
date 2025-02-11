part of './../../../core/helpers/export_manager/export_manager.dart';

class TopRatedTvsWidget extends StatelessWidget {
  const TopRatedTvsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsBloc, TvsStates>(
      buildWhen: (previous, current) =>
          previous.topRatedStates != current.topRatedStates,
      builder: (context, state) {
        if (state.topRatedStates == RequestState.loading) {
          return BuildContentTv(
            tvModel: TvSeeMoreModel(
              title: AppString.topRated,
              tvList: state.topRatedTvs,
            ),
          ).skeletonize();
        } else if (state.topRatedStates == RequestState.loaded) {
          state.topRatedTvs.shuffle(Random());
          return BuildContentTv(
            tvModel: TvSeeMoreModel(
              title: AppString.topRated,
              tvList: state.topRatedTvs,
            ),
          );
        } else {
          return BuildErrorMessage(errorMessage: state.topRatedMessage);
        }
      },
    );
  }
}
