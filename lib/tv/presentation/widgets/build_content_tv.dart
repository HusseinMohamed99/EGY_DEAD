part of '../../../core/helpers/export_manager/export_manager.dart';

class BuildContentTv extends StatelessWidget {
  const BuildContentTv({
    super.key,
    required this.tvModel,
  });
  final TvSeeMoreModel tvModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: tvModel.title,
          onTap: () {
            navigateToTvSeeMore(
              context: context,
              tvModel: tvModel,
            );
          },
        ),
        ContentTvWidget(tvModel: tvModel.tvList),
      ],
    );
  }
}

class ContentTvWidget extends StatelessWidget {
  const ContentTvWidget({
    required this.tvModel,
    super.key,
  });

  final List<Tvs> tvModel;
  @override
  Widget build(BuildContext context) {
    return HorizontalListView(
      itemCount: tvModel.length,
      itemBuilder: (context, index) {
        return HorizontalTvCardView(tvModel: tvModel[index]);
      },
    );
  }
}

class HorizontalTvCardView extends StatelessWidget {
  const HorizontalTvCardView({
    super.key,
    required this.tvModel,
  });
  final Tvs? tvModel;

  @override
  Widget build(BuildContext context) {
    return ContentDisplayCard(
      navigateToDetailsSection: () {
        navigateToTvDetails(context, tvModel?.id ?? 0);
      },
      imageUrl: ApiConstance.imageURL(tvModel?.backdropPath ?? ''),
    );
  }
}
