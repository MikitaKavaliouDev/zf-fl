import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../trainers/cubit/workout_session_cubit.dart';
import '../../trainers/cubit/workout_session_state.dart';
import '../../trainers/presentation/widgets/workout_mini_player.dart';

/// Shell route builder for the trainer tab layout.
///
/// 5 tabs: Calendar, Programs, Dashboard, Clients, More.
/// Mirrors [_MainShell] from [app_router.dart] — same mini-player overlay.
class TrainerShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const TrainerShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          // Mini player overlay — same pattern as client shell.
          BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
            buildWhen: (previous, current) {
              final prevMinimized =
                  previous is WorkoutSessionActive && previous.isMinimized;
              final currMinimized =
                  current is WorkoutSessionActive && current.isMinimized;
              return prevMinimized != currMinimized;
            },
            builder: (context, state) {
              if (state is WorkoutSessionActive && state.isMinimized) {
                return Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 8,
                    ),
                    child: const WorkoutMiniPlayer(),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (i) => navigationShell.goBranch(
          i,
          initialLocation: i == navigationShell.currentIndex,
        ),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.mutedText,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month_rounded),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_outlined),
            activeIcon: Icon(Icons.fitness_center_rounded),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined),
            activeIcon: Icon(Icons.people_rounded),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            activeIcon: Icon(Icons.more_horiz_rounded),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
