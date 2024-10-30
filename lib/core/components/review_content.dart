part of './../helpers/export_manager/export_manager.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    review.authorUserName,
                    style: textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              '''Key Adjustments
    Return Type Clarification: The getThemeData method now returns a Map<AppTheme, ThemeData>, which matches your usage intent and provides better type safety.
    
    textTheme Modification: Used .copyWith on GoogleFonts.robotoTextTheme() to set your custom TextTheme. This ensures that any additional properties set by RobotoTextTheme are retained.
    
    ScreenUtil Adaptation: Added .sp to all fontSize and size properties to support responsiveness based on screen size, ensuring that fonts and icons scale properly across different devices.
    
    Consistency Check: The ColorManager properties are consistent across all elements, which looks correct as you’ve used ColorManager to maintain a uniform color scheme.Key Adjustments
    Return Type Clarification: The getThemeData method now returns a Map<AppTheme, ThemeData>, which matches your usage intent and provides better type safety.
    
    textTheme Modification: Used .copyWith on GoogleFonts.robotoTextTheme() to set your custom TextTheme. This ensures that any additional properties set by RobotoTextTheme are retained.
    
    ScreenUtil Adaptation: Added .sp to all fontSize and size properties to support responsiveness based on screen size, ensuring that fonts and icons scale properly across different devices.
    
    Consistency Check: The ColorManager properties are consistent across all elements, which looks correct as you’ve used ColorManager to maintain a uniform color scheme.Key Adjustments
    Return Type Clarification: The getThemeData method now returns a Map<AppTheme, ThemeData>, which matches your usage intent and provides better type safety.
    
    textTheme Modification: Used .copyWith on GoogleFonts.robotoTextTheme() to set your custom TextTheme. This ensures that any additional properties set by RobotoTextTheme are retained.
    
    ScreenUtil Adaptation: Added .sp to all fontSize and size properties to support responsiveness based on screen size, ensuring that fonts and icons scale properly across different devices.
    
    Consistency Check: The ColorManager properties are consistent across all elements, which looks correct as you’ve used ColorManager to maintain a uniform color scheme.Key Adjustments
    Return Type Clarification: The getThemeData method now returns a Map<AppTheme, ThemeData>, which matches your usage intent and provides better type safety.
    
    textTheme Modification: Used .copyWith on GoogleFonts.robotoTextTheme() to set your custom TextTheme. This ensures that any additional properties set by RobotoTextTheme are retained.
    
    ScreenUtil Adaptation: Added .sp to all fontSize and size properties to support responsiveness based on screen size, ensuring that fonts and icons scale properly across different devices.
    
    Consistency Check: The ColorManager properties are consistent across all elements, which looks correct as you’ve used ColorManager to maintain a uniform color scheme.''',
              style: textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
