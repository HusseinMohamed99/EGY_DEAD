part of './../../core/helpers/export_manager/export_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainBloc>(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.currentIndex,
                onTap: (index) {
                  MainBloc.get(context).add(ChangeCurrentIndexEvent(index));
                },
                showSelectedLabels: true,
                showUnselectedLabels: false,
                items: [
                  bottomNavigationBarItem(icon: Icons.movie, label: "Movies"),
                  bottomNavigationBarItem(icon: Icons.tv, label: "Tvs"),
                  bottomNavigationBarItem(icon: Icons.search, label: "Search"),
                  bottomNavigationBarItem(
                      icon: Icons.settings, label: "Settings"),
                ],
              ),
              body: state.screens[state.currentIndex],
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      backgroundColor: Colors.black,
    );
  }
}
