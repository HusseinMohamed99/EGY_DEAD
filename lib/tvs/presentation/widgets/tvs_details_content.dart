part of './../../../core/helpers/export_manager/export_manager.dart';

class TvsDetailsContent extends StatelessWidget {
  const TvsDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        if (state.tvsDetailsStates == RequestState.loading) {
          return Skeletonizer(
            switchAnimationConfig: SwitchAnimationConfig(
              duration: Duration(milliseconds: 800),
              reverseDuration: Duration(milliseconds: 800),
            ),
            child: TvsDetailsContentLoaded(state: state),
          );
        } else if (state.tvsDetailsStates == RequestState.loaded) {
          return TvsDetailsContentLoaded(state: state);
        } else {
          return BuildErrorMessage(errorMessage: state.tvsDetailsMessage);
        }
      },
    );
  }
}
