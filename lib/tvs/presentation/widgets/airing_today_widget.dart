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
          return IsListLoading();
        } else if (state.airingTodayState == RequestState.loaded) {
          state.airingTodayTvs.shuffle(Random());
          return BuildContentTv(
            fetchData: false,
            tvModel: state.airingTodayTvs,
            title: AppString.airingToday,
            isLoading: state.airingTodayState == RequestState.loading,
            addEvent: () {},
          );
        } else if (state.airingTodayState == RequestState.fetchData) {
          state.airingTodayTvs.shuffle(Random());
          return BuildContentTv(
            fetchData: true,
            tvModel: state.airingTodayTvs,
            title: AppString.airingToday,
            isLoading: state.airingTodayState == RequestState.loading,
            addEvent: () {},
          );
        } else {
          return BuildErrorMessage(errorMessage: state.airingTodayMessage);
        }
      },
    );
  }
}
