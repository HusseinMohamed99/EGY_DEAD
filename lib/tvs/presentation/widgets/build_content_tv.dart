part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildContentTv extends StatelessWidget {
  const BuildContentTv({
    super.key,
    required this.tvModel,
    required this.title,
    required this.isLoading,
    required this.addEvent,
    required this.fetchData,
  });
  final List<Tvs> tvModel;
  final String title;
  final bool isLoading;
  final VoidCallback addEvent;
  final bool fetchData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildHeaderTvWidget(
          fetchData: fetchData,
          tvModel: tvModel,
          title: title,
          addEvent: addEvent,
        ),
        ContentTvWidget(tvModel: tvModel),
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
        return HorizontalListViewCardTv(tvModel: tvModel[index]);
      },
    );
  }
}

class BuildHeaderTvWidget extends StatelessWidget {
  const BuildHeaderTvWidget({
    super.key,
    required this.title,
    required this.tvModel,
    required this.addEvent,
    required this.fetchData,
  });
  final String title;
  final List<Tvs> tvModel;
  final VoidCallback addEvent;
  final bool fetchData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall,
          ),
          GestureDetector(
            onTap: () {
              navigateToTvSeeMore(
                context: context,
                tvModel: tvModel,
                title: title,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Row(
                children: [
                  Text(
                    AppString.seeMore,
                    style: context.textTheme.labelSmall,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: ColorManager.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListViewCardTv extends StatelessWidget {
  const HorizontalListViewCardTv({
    super.key,
    required this.tvModel,
  });

  final Tvs? tvModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8.w),
      child: InkWell(
        onTap: () {
          navigateToTvDetails(context, tvModel?.id ?? 0);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
          child: CachedImage(
            boxFit: BoxFit.fitHeight,
            imageUrl: ApiConstance.imageURL(tvModel?.backdropPath ?? ''),
            width: 120.w,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
