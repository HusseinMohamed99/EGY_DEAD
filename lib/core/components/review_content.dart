part of './../helpers/export_manager/export_manager.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: Avatar(avatarUrl: review.avatarUrl),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.authorName,
                    style: context.textTheme.titleSmall,
                  ),
                  Text(
                    review.authorUserName,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              review.content,
              style: context.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
