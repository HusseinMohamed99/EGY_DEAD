import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeMoreAllMovies extends StatefulWidget {
  const SeeMoreAllMovies({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.addEvent,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final VoidCallback addEvent;

  @override
  State<SeeMoreAllMovies> createState() => _SeeMoreAllMoviesState();
}

class _SeeMoreAllMoviesState extends State<SeeMoreAllMovies> {
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
        widget.addEvent(); // Trigger fetching more data
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
