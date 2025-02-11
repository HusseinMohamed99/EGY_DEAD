part of './../../../core/helpers/export_manager/export_manager.dart';

class AiringTodayWidget extends StatelessWidget {
  const AiringTodayWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsBloc, TvsStates>(
      buildWhen: (previous, current) =>
          previous.airingTodayState != current.airingTodayState,
      builder: (context, state) {
        if (state.airingTodayState == RequestState.loading) {
          return BuildContentTv(
            tvModel: TvSeeMoreModel(
              title: AppString.airingToday,
              tvList: state.airingTodayTvs,
            ),
          ).skeletonize();
        } else if (state.airingTodayState == RequestState.loaded) {
          state.airingTodayTvs.shuffle(Random());
          return BuildContentTv(
            tvModel: TvSeeMoreModel(
              tvList: state.airingTodayTvs,
              title: AppString.airingToday,
            ),
          );
        } else {
          return BuildErrorMessage(errorMessage: state.airingTodayMessage);
        }
      },
    );
  }
}
