part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildHeaderWidget extends StatelessWidget {
  const BuildHeaderWidget({
    super.key,
    required this.title,
    required this.movies,
    required this.addEvent,
    required this.fetchData,
  });
  final String title;
  final List<Movies> movies;
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
              navigateToSeeMore(
                fetchData: fetchData,
                context: context,
                movies: movies,
                title: title,
                addEvent: addEvent,
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
