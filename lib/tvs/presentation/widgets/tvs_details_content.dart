part of './../../../core/helpers/export_manager/export_manager.dart';

class TvsDetailsContent extends StatelessWidget {
  const TvsDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        if (state.tvsDetailsStates == RequestState.loading) {
          return LoadingTvsDetailsContent();
        } else if (state.tvsDetailsStates == RequestState.loaded) {
          return TvsDetailsContentLoaded(state: state);
        } else {
          return BuildErrorMessage(errorMessage: state.tvsDetailsMessage);
        }
      },
    );
  }
}
