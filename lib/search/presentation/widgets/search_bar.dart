import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/global/theme/style/color_manger.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data.dart';
import 'package:movies_app/core/helpers/enum/enum.dart';
import 'package:movies_app/search/presentation/controllers/search_bloc/search_bloc.dart';
import 'package:movies_app/search/presentation/controllers/search_bloc/search_event.dart';

class SearchBarItem extends StatefulWidget {
  const SearchBarItem({
    super.key,
  });

  @override
  State<SearchBarItem> createState() => _SearchBarItemState();
}

class _SearchBarItemState extends State<SearchBarItem> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.darkTheme]!.textTheme;
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: textController,
      cursorColor: ColorManager.greyDarkColor,
      cursorWidth: 1,
      style: textTheme.bodyLarge,
      onChanged: (title) {
        context.read<SearchBloc>().add(GetSearchResultsEvent(title));
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.greyDarkColor,
          ),
          borderRadius: BorderRadius.circular(8).r,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.greyDarkColor,
          ),
          borderRadius: BorderRadius.circular(8).r,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          size: 24.sp,
          color: ColorManager.whiteColor,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            textController.text = '';
            context.read<SearchBloc>().add(const GetSearchResultsEvent(''));
          },
          child: Icon(
            Icons.clear_rounded,
            size: 24.sp,
            color: ColorManager.whiteColor,
          ),
        ),
        hintText: 'Search',
        hintStyle: textTheme.bodyLarge,
      ),
    );
  }
}
