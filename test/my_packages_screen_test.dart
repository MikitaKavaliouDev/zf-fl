import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ziro_fit/core/events/event_bus.dart';
import 'package:ziro_fit/features/home/data/home_repository.dart';
import 'package:ziro_fit/features/profile/presentation/settings_screens/my_packages_screen.dart';
import 'package:ziro_fit/features/trainers/data/trainer_api_service.dart';

class MockTrainerApiService extends Mock implements TrainerApiService {}
class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late TrainerApiService trainerApi;
  late HomeRepository homeRepo;

  setUp(() {
    trainerApi = MockTrainerApiService();
    homeRepo = MockHomeRepository();
    SharedPreferences.setMockInitialValues({});

    final getIt = GetIt.instance;
    getIt.reset();
    getIt.registerSingleton<TrainerApiService>(trainerApi);
    getIt.registerSingleton<HomeRepository>(homeRepo);
    getIt.registerSingleton<EventBus>(EventBus());
  });

  group('MyPackagesScreen', () {
    testWidgets('renders AppBar with title', (tester) async {
      when(() => homeRepo.getDashboard())
          .thenThrow(Exception('No linked trainer'));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const MyPackagesScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('My Packages'), findsOneWidget);
    });

    testWidgets('shows no trainer state when no trainer linked',
        (tester) async {
      when(() => homeRepo.getDashboard())
          .thenThrow(Exception('No linked trainer'));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const MyPackagesScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No trainer linked'), findsOneWidget);
      expect(
        find.text('Connect with a trainer to view\navailable packages.'),
        findsOneWidget,
      );
    });

    testWidgets('shows empty state when no packages available',
        (tester) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('linked_trainer_username', 'testtrainer');

      when(() => homeRepo.getDashboard())
          .thenThrow(Exception('Not needed'));
      when(() => trainerApi.getTrainerPackages('testtrainer'))
          .thenAnswer((_) async => []);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const MyPackagesScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No Packages Yet'), findsOneWidget);
    });
  });
}
