// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ziro_fit/core/connectivity/connectivity_module.dart' as _i779;
import 'package:ziro_fit/core/connectivity/connectivity_service.dart' as _i124;
import 'package:ziro_fit/core/database/app_database.dart' as _i365;
import 'package:ziro_fit/core/location/location_service.dart' as _i467;
import 'package:ziro_fit/core/network/api_logger_interceptor.dart' as _i831;
import 'package:ziro_fit/core/network/auth_interceptor.dart' as _i680;
import 'package:ziro_fit/core/network/dio_client.dart' as _i488;
import 'package:ziro_fit/core/security/token_storage.dart' as _i601;
import 'package:ziro_fit/features/analytics/cubit/analytics_cubit.dart'
    as _i899;
import 'package:ziro_fit/features/analytics/data/analytics_api_service.dart'
    as _i396;
import 'package:ziro_fit/features/analytics/data/analytics_local_service.dart'
    as _i296;
import 'package:ziro_fit/features/analytics/data/analytics_repository.dart'
    as _i512;
import 'package:ziro_fit/features/analytics/data/exercise_progress_api_service.dart'
    as _i1003;
import 'package:ziro_fit/features/analytics/data/measurements_api_service.dart'
    as _i181;
import 'package:ziro_fit/features/analytics/data/measurements_repository.dart'
    as _i514;
import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart' as _i514;
import 'package:ziro_fit/features/auth/data/auth_api_service.dart' as _i568;
import 'package:ziro_fit/features/auth/data/auth_repository.dart' as _i736;
import 'package:ziro_fit/features/check_in/cubit/check_in_cubit.dart' as _i465;
import 'package:ziro_fit/features/check_in/data/check_in_api_service.dart'
    as _i207;
import 'package:ziro_fit/features/check_in/data/check_in_repository.dart'
    as _i979;
import 'package:ziro_fit/features/daily_targets/cubit/daily_targets_cubit.dart'
    as _i501;
import 'package:ziro_fit/features/daily_targets/data/daily_targets_api_service.dart'
    as _i1058;
import 'package:ziro_fit/features/daily_targets/data/daily_targets_repository.dart'
    as _i607;
import 'package:ziro_fit/features/explore/cubit/event_detail_cubit.dart'
    as _i803;
import 'package:ziro_fit/features/explore/cubit/explore_cubit.dart' as _i64;
import 'package:ziro_fit/features/explore/cubit/explore_map_cubit.dart'
    as _i377;
import 'package:ziro_fit/features/explore/cubit/trainer_discovery_cubit.dart'
    as _i975;
import 'package:ziro_fit/features/explore/data/explore_api_service.dart'
    as _i549;
import 'package:ziro_fit/features/fitness_goals/cubit/fitness_goals_cubit.dart'
    as _i413;
import 'package:ziro_fit/features/fitness_goals/data/fitness_goals_api_service.dart'
    as _i1029;
import 'package:ziro_fit/features/fitness_goals/data/fitness_goals_repository.dart'
    as _i1035;
import 'package:ziro_fit/features/home/cubit/home_cubit.dart' as _i13;
import 'package:ziro_fit/features/home/cubit/program_cubit.dart' as _i727;
import 'package:ziro_fit/features/home/cubit/template_detail_cubit.dart'
    as _i137;
import 'package:ziro_fit/features/home/data/home_api_service.dart' as _i267;
import 'package:ziro_fit/features/home/data/home_repository.dart' as _i516;
import 'package:ziro_fit/features/home/data/local_template_repository.dart'
    as _i783;
import 'package:ziro_fit/features/home/data/program_api_service.dart' as _i755;
import 'package:ziro_fit/features/home/data/program_repository.dart' as _i875;
import 'package:ziro_fit/features/notifications/cubit/notifications_cubit.dart'
    as _i861;
import 'package:ziro_fit/features/notifications/data/api/notification_api_service.dart'
    as _i781;
import 'package:ziro_fit/features/notifications/data/repositories/notification_repository.dart'
    as _i329;
import 'package:ziro_fit/features/notifications/data/services/notification_realtime_service.dart'
    as _i115;
import 'package:ziro_fit/features/nutrition_habits/cubit/nutrition_habits_cubit.dart'
    as _i560;
import 'package:ziro_fit/features/nutrition_habits/data/nutrition_habits_api_service.dart'
    as _i416;
import 'package:ziro_fit/features/nutrition_habits/data/nutrition_habits_repository.dart'
    as _i982;
import 'package:ziro_fit/features/profile/cubit/more_cubit.dart' as _i19;
import 'package:ziro_fit/features/profile/cubit/profile_config_cubit.dart'
    as _i851;
import 'package:ziro_fit/features/profile/data/profile_api_service.dart'
    as _i768;
import 'package:ziro_fit/features/sharing/cubit/sharing_cubit.dart' as _i28;
import 'package:ziro_fit/features/sharing/data/sharing_api_service.dart'
    as _i796;
import 'package:ziro_fit/features/sharing/data/sharing_repository.dart'
    as _i742;
import 'package:ziro_fit/features/sync/cubit/sync_cubit.dart' as _i796;
import 'package:ziro_fit/features/sync/data/sync_api_service.dart' as _i93;
import 'package:ziro_fit/features/sync/data/sync_repository.dart' as _i813;
import 'package:ziro_fit/features/sync/workout_realtime_service.dart' as _i197;
import 'package:ziro_fit/features/trainers/cubit/trainer_list_cubit.dart'
    as _i329;
import 'package:ziro_fit/features/trainers/cubit/workout_history_cubit.dart'
    as _i195;
import 'package:ziro_fit/features/trainers/cubit/workout_session_cubit.dart'
    as _i871;
import 'package:ziro_fit/features/trainers/data/booking_api_service.dart'
    as _i637;
import 'package:ziro_fit/features/trainers/data/booking_repository.dart'
    as _i549;
import 'package:ziro_fit/features/trainers/data/trainer_api_service.dart'
    as _i680;
import 'package:ziro_fit/features/trainers/data/trainer_repository.dart'
    as _i1063;
import 'package:ziro_fit/features/trainers/data/workout_session_api_service.dart'
    as _i662;
import 'package:ziro_fit/features/trainers/data/workout_session_repository.dart'
    as _i459;
import 'package:ziro_fit/features/voice_coach/cubit/voice_coach_cubit.dart'
    as _i305;
import 'package:ziro_fit/features/voice_coach/data/services/voice_coach_service.dart'
    as _i232;
import 'package:ziro_fit/features/voice_coach/data/services/voice_settings_api_service.dart'
    as _i315;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final connectivityModule = _$ConnectivityModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i895.Connectivity>(() => connectivityModule.connectivity);
    gh.singleton<_i365.AppDatabase>(() => _i365.AppDatabase());
    gh.singleton<_i467.LocationService>(() => _i467.LocationService());
    gh.singleton<_i831.ApiLoggerInterceptor>(
      () => _i831.ApiLoggerInterceptor(),
    );
    gh.singleton<_i601.TokenStorage>(() => _i601.TokenStorage());
    gh.singleton<_i115.NotificationRealtimeService>(
      () => _i115.NotificationRealtimeService(),
    );
    gh.lazySingleton<_i197.WorkoutRealtimeService>(
      () => _i197.WorkoutRealtimeService(),
    );
    gh.lazySingleton<_i232.VoiceCoachService>(() => _i232.VoiceCoachService());
    gh.singleton<_i124.ConnectivityService>(
      () => _i124.ConnectivityService(connectivity: gh<_i895.Connectivity>()),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i296.AnalyticsLocalService>(
      () => _i296.AnalyticsLocalService(gh<_i365.AppDatabase>()),
    );
    gh.singleton<_i783.LocalTemplateRepository>(
      () => _i783.LocalTemplateRepository(gh<_i365.AppDatabase>()),
    );
    gh.factory<_i305.VoiceCoachCubit>(
      () => _i305.VoiceCoachCubit(
        gh<_i232.VoiceCoachService>(),
        gh<_i197.WorkoutRealtimeService>(),
      ),
    );
    gh.singleton<_i680.AuthInterceptor>(
      () => _i680.AuthInterceptor(gh<_i601.TokenStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideDio(
        gh<_i831.ApiLoggerInterceptor>(),
        gh<_i680.AuthInterceptor>(),
      ),
    );
    gh.factory<_i396.AnalyticsApiService>(
      () => _i396.AnalyticsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i1003.ExerciseProgressApiService>(
      () => _i1003.ExerciseProgressApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i181.MeasurementsApiService>(
      () => _i181.MeasurementsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i568.AuthApiService>(
      () => _i568.AuthApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i207.CheckInApiService>(
      () => _i207.CheckInApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i1058.DailyTargetsApiService>(
      () => _i1058.DailyTargetsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i549.ExploreApiService>(
      () => _i549.ExploreApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i1029.FitnessGoalsApiService>(
      () => _i1029.FitnessGoalsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i267.HomeApiService>(
      () => _i267.HomeApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i755.ProgramApiService>(
      () => _i755.ProgramApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i781.NotificationApiService>(
      () => _i781.NotificationApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i416.NutritionHabitsApiService>(
      () => _i416.NutritionHabitsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i768.ProfileApiService>(
      () => _i768.ProfileApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i796.SharingApiService>(
      () => _i796.SharingApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i93.SyncApiService>(() => _i93.SyncApiService(gh<_i361.Dio>()));
    gh.factory<_i637.BookingApiService>(
      () => _i637.BookingApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i680.TrainerApiService>(
      () => _i680.TrainerApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i662.WorkoutSessionApiService>(
      () => _i662.WorkoutSessionApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i315.VoiceSettingsApiService>(
      () => _i315.VoiceSettingsApiService(gh<_i361.Dio>()),
    );
    gh.singleton<_i1035.FitnessGoalsRepository>(
      () => _i1035.FitnessGoalsRepository(gh<_i1029.FitnessGoalsApiService>()),
    );
    gh.singleton<_i979.CheckInRepository>(
      () => _i979.CheckInRepository(gh<_i207.CheckInApiService>()),
    );
    gh.factory<_i465.CheckInCubit>(
      () => _i465.CheckInCubit(gh<_i979.CheckInRepository>()),
    );
    gh.singleton<_i514.MeasurementsRepository>(
      () => _i514.MeasurementsRepository(gh<_i181.MeasurementsApiService>()),
    );
    gh.singleton<_i459.WorkoutSessionRepository>(
      () =>
          _i459.WorkoutSessionRepository(gh<_i662.WorkoutSessionApiService>()),
    );
    gh.singleton<_i549.BookingRepository>(
      () => _i549.BookingRepository(gh<_i637.BookingApiService>()),
    );
    gh.singleton<_i813.SyncRepository>(
      () => _i813.SyncRepository(
        gh<_i93.SyncApiService>(),
        gh<_i365.AppDatabase>(),
      ),
    );
    gh.singleton<_i329.NotificationRepository>(
      () => _i329.NotificationRepository(gh<_i781.NotificationApiService>()),
    );
    gh.singleton<_i516.HomeRepository>(
      () => _i516.HomeRepository(gh<_i267.HomeApiService>()),
    );
    gh.factory<_i803.EventDetailCubit>(
      () => _i803.EventDetailCubit(gh<_i549.ExploreApiService>()),
    );
    gh.factory<_i64.ExploreCubit>(
      () => _i64.ExploreCubit(gh<_i549.ExploreApiService>()),
    );
    gh.factory<_i975.TrainerDiscoveryCubit>(
      () => _i975.TrainerDiscoveryCubit(gh<_i549.ExploreApiService>()),
    );
    gh.factory<_i413.FitnessGoalsCubit>(
      () => _i413.FitnessGoalsCubit(gh<_i1035.FitnessGoalsRepository>()),
    );
    gh.singleton<_i736.AuthRepository>(
      () => _i736.AuthRepository(
        gh<_i568.AuthApiService>(),
        gh<_i601.TokenStorage>(),
      ),
    );
    gh.factory<_i377.ExploreMapCubit>(
      () => _i377.ExploreMapCubit(
        gh<_i549.ExploreApiService>(),
        gh<_i467.LocationService>(),
      ),
    );
    gh.singleton<_i982.NutritionHabitsRepository>(
      () => _i982.NutritionHabitsRepository(
        gh<_i416.NutritionHabitsApiService>(),
      ),
    );
    gh.singleton<_i1063.TrainerRepository>(
      () => _i1063.TrainerRepository(gh<_i680.TrainerApiService>()),
    );
    gh.singleton<_i512.AnalyticsRepository>(
      () => _i512.AnalyticsRepository(
        gh<_i396.AnalyticsApiService>(),
        gh<_i1003.ExerciseProgressApiService>(),
      ),
    );
    gh.factory<_i861.NotificationsCubit>(
      () => _i861.NotificationsCubit(
        gh<_i329.NotificationRepository>(),
        gh<_i115.NotificationRealtimeService>(),
      ),
    );
    gh.singleton<_i742.SharingRepository>(
      () => _i742.SharingRepository(gh<_i796.SharingApiService>()),
    );
    gh.factory<_i514.AuthCubit>(
      () => _i514.AuthCubit(gh<_i736.AuthRepository>()),
    );
    gh.singleton<_i607.DailyTargetsRepository>(
      () => _i607.DailyTargetsRepository(gh<_i1058.DailyTargetsApiService>()),
    );
    gh.factory<_i501.DailyTargetsCubit>(
      () => _i501.DailyTargetsCubit(gh<_i607.DailyTargetsRepository>()),
    );
    gh.singleton<_i875.ProgramRepository>(
      () => _i875.ProgramRepository(gh<_i755.ProgramApiService>()),
    );
    gh.factory<_i137.TemplateDetailCubit>(
      () => _i137.TemplateDetailCubit(gh<_i459.WorkoutSessionRepository>()),
    );
    gh.factory<_i19.MoreCubit>(
      () =>
          _i19.MoreCubit(gh<_i768.ProfileApiService>(), gh<_i514.AuthCubit>()),
    );
    gh.factory<_i851.ProfileConfigCubit>(
      () => _i851.ProfileConfigCubit(
        gh<_i768.ProfileApiService>(),
        gh<_i514.AuthCubit>(),
      ),
    );
    gh.singleton<_i796.SyncCubit>(
      () => _i796.SyncCubit(
        gh<_i813.SyncRepository>(),
        gh<_i124.ConnectivityService>(),
      ),
    );
    gh.factory<_i28.SharingCubit>(
      () => _i28.SharingCubit(gh<_i742.SharingRepository>()),
    );
    gh.factory<_i195.WorkoutHistoryCubit>(
      () => _i195.WorkoutHistoryCubit(gh<_i459.WorkoutSessionRepository>()),
    );
    gh.factory<_i871.WorkoutSessionCubit>(
      () => _i871.WorkoutSessionCubit(gh<_i459.WorkoutSessionRepository>()),
    );
    gh.factory<_i329.TrainerListCubit>(
      () => _i329.TrainerListCubit(gh<_i1063.TrainerRepository>()),
    );
    gh.factory<_i560.NutritionHabitsCubit>(
      () => _i560.NutritionHabitsCubit(gh<_i982.NutritionHabitsRepository>()),
    );
    gh.factory<_i13.HomeCubit>(
      () => _i13.HomeCubit(gh<_i516.HomeRepository>()),
    );
    gh.factory<_i899.AnalyticsCubit>(
      () => _i899.AnalyticsCubit(
        gh<_i512.AnalyticsRepository>(),
        gh<_i296.AnalyticsLocalService>(),
        gh<_i124.ConnectivityService>(),
        gh<_i514.MeasurementsRepository>(),
      ),
    );
    gh.factory<_i727.ProgramCubit>(
      () => _i727.ProgramCubit(
        gh<_i875.ProgramRepository>(),
        gh<_i783.LocalTemplateRepository>(),
        gh<_i459.WorkoutSessionRepository>(),
      ),
    );
    return this;
  }
}

class _$ConnectivityModule extends _i779.ConnectivityModule {}

class _$NetworkModule extends _i488.NetworkModule {}
