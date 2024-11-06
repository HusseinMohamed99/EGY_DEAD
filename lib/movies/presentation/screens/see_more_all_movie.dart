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
  final Function addEvent;
  @override
  State<SeeMoreAllMovies> createState() => _SeeMoreAllMoviesState();
}

class _SeeMoreAllMoviesState extends State<SeeMoreAllMovies> {
  final _scrollController = ScrollController();
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

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        widget.addEvent();
      }
    }
  }
}
