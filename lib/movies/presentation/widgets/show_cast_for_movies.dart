part of './../../../core/helpers/export_manager/export_manager.dart';

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
