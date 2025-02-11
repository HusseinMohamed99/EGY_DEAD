import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/helpers/logs/app_logs.dart';

class ExploreAllMoviesOrTvsPage extends StatefulWidget {
  const ExploreAllMoviesOrTvsPage({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.addEvent,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final VoidCallback? addEvent;

  @override
  State<ExploreAllMoviesOrTvsPage> createState() =>
      _ExploreAllMoviesOrTvsPageState();
}

class _ExploreAllMoviesOrTvsPageState extends State<ExploreAllMoviesOrTvsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if we've reached the bottom of the list
    if (_scrollController.position.atEdge) {
      bool isBottom = _scrollController.position.pixels != 0;
      if (isBottom) {
        if (widget.addEvent != null) {
          widget.addEvent!(); // Trigger fetching more data
        } else {
          AppLogs.errorLog('No more data to fetch');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}
