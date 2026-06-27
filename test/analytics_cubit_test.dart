import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ziro_fit/core/connectivity/connectivity_service.dart';
import 'package:ziro_fit/core/events/event_bus.dart';
import 'package:ziro_fit/features/analytics/cubit/analytics_cubit.dart';
import 'package:ziro_fit/features/analytics/cubit/analytics_state.dart';
import 'package:ziro_fit/features/analytics/data/analytics_local_service.dart';
import 'package:ziro_fit/features/analytics/data/analytics_repository.dart';
import 'package:ziro_fit/features/analytics/data/measurements_repository.dart';
import 'package:ziro_fit/features/analytics/data/models/analytics_response_dto.dart';
import 'package:ziro_fit/features/analytics/data/models/progress_response_dto.dart';
import 'package:ziro_fit/features/analytics/data/models/widget_config_dto.dart';

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}
class MockAnalyticsLocalService extends Mock implements AnalyticsLocalService {}
class MockConnectivityService extends Mock implements ConnectivityService {}
class MockMeasurementsRepository extends Mock implements MeasurementsRepository {}

void main() {
  late AnalyticsRepository repository;
  late AnalyticsLocalService localService;
  late ConnectivityService connectivity;
  late MeasurementsRepository measurementsRepository;
  late AnalyticsCubit cubit;

  setUpAll(() {
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<EventBus>()) {
      getIt.registerSingleton<EventBus>(EventBus());
    }
  });

  setUp(() {
    repository = MockAnalyticsRepository();
    localService = MockAnalyticsLocalService();
    connectivity = MockConnectivityService();
    measurementsRepository = MockMeasurementsRepository();

    when(() => connectivity.isOnline).thenReturn(true);
    when(() => connectivity.onConnectivityChanged)
        .thenAnswer((_) => const Stream.empty());

    cubit = AnalyticsCubit(repository, localService, connectivity, measurementsRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('AnalyticsCubit', () {
    test('initial state is AnalyticsInitial', () {
      expect(cubit.state, const AnalyticsState.initial());
    });

    blocTest<AnalyticsCubit, AnalyticsState>(
      'loadData() cache-first pulls from local service and refreshes via repository',
      build: () {
        when(() => localService.cachedAnalytics()).thenAnswer((_) async => null);
        when(() => localService.cachedProgress()).thenAnswer((_) async => null);
        when(() => localService.cachedWidgetConfig()).thenAnswer((_) async => null);

        when(() => repository.getAnalytics()).thenAnswer((_) async => const AnalyticsResponseDto());
        when(() => repository.getProgress()).thenAnswer((_) async => const ProgressResponseDto());
        when(() => repository.getWidgetConfig()).thenAnswer((_) async => const WidgetConfigDto());

        when(() => localService.cacheAnalytics(any())).thenAnswer((_) async {});
        when(() => localService.cacheProgress(any())).thenAnswer((_) async {});
        when(() => localService.cacheWidgetConfig(any())).thenAnswer((_) async {});

        return cubit;
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [
        const AnalyticsState.loading(),
        isA<AnalyticsLoaded>(),
      ],
    );

    blocTest<AnalyticsCubit, AnalyticsState>(
      'toggleWidgetVisibility updates list visible items correctly',
      build: () {
        return cubit;
      },
      seed: () => const AnalyticsState.loaded(
        analytics: AnalyticsResponseDto(),
        progress: ProgressResponseDto(),
        widgets: WidgetConfigDto(widgets: [
          WidgetConfigItem(id: 'w1', type: 'prs', isVisible: true, order: 0),
        ]),
      ),
      act: (cubit) => cubit.toggleWidgetVisibility('w1'),
      expect: () => [
        isA<AnalyticsLoaded>().having(
          (s) => s.widgets.widgets.first.isVisible,
          'isVisible',
          false,
        ),
      ],
    );
  });
}
      