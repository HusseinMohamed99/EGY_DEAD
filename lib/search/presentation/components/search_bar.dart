import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return Form(
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: textController,
        cursorColor: Colors.grey,
        cursorWidth: 1,
        style: textTheme.bodyLarge,
        onChanged: (title) {
          context.read<SearchBloc>().add(GetSearchResultsEvent(title));
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              textController.text = '';
              context.read<SearchBloc>().add(const GetSearchResultsEvent(''));
            },
            child: const Icon(
              Icons.clear_rounded,
              color: Colors.white,
            ),
          ),
          hintText: 'Search',
          hintStyle: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
