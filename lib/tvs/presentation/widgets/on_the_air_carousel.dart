part of './../../../core/helpers/export_manager/export_manager.dart';

class OnTheAirCarousel extends StatelessWidget {
  const OnTheAirCarousel({super.key, required this.tvModel});
  final List<Tvs> tvModel;
  @override
  Widget build(BuildContext context) {
    return BuildCarouselWidget(
      items: tvModel
          .map((tvModel) => BuildCarouselTvItem(tvModel: tvModel))
          .toList(),
    );
  }
}

class BuildCarouselTvItem extends StatelessWidget {
  const BuildCarouselTvItem({
    super.key,
    required this.tvModel,
  });
  final Tvs tvModel;

  @override
  Widget build(BuildContext context) {
    return CarouselItem(
      navigateToDetailsSection: () {
        navigateToDetailsSection(context, tvModel.id);
      },
      imageUrl: ApiConstance.imageURL(tvModel.backdropPath),
      title: tvModel.name,
      sectionName: AppString.onAir,
    );
  }
}
