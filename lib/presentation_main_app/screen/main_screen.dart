import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation_main_app/controller/main_bloc.dart';
import 'package:movies_app/presentation_main_app/controller/main_event.dart';
import 'package:movies_app/presentation_main_app/controller/main_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (index) {
                MainBloc.get(context).add(ChangeCurrentIndexEvent(index));
              },
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: [
                bottomNavigationBarItem(
                    icon: Icons.movie, label: "Movies".toUpperCase()),
                bottomNavigationBarItem(
                    icon: Icons.tv, label: "Tvs".toUpperCase()),
                bottomNavigationBarItem(
                    icon: Icons.search, label: "Search".toUpperCase()),
                bottomNavigationBarItem(
                    icon: Icons.settings, label: "settings".toUpperCase()),
              ],
            ),
            body: state.screens[state.currentIndex],
          );
        },
      ),
    );
  }
}

BottomNavigationBarItem bottomNavigationBarItem({
  required IconData icon,
  required String label,
}) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
