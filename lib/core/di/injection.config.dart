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
import 'package:tanquery_flutter/tanquery_flutter.dart' as _i448;
import 'package:ziro_fit/core/connectivity/connectivity_module.dart' as _i779;
import 'package:ziro_fit/core/connectivity/connectivity_service.dart' as _i124;
import 'package:ziro_fit/core/database/app_database.dart' as _i365;
import 'package:ziro_fit/core/di/query_client_module.dart' as _i397;
import 'package:ziro_fit/core/location/location_service.dart' as _i467;
import 'package:ziro_fit/core/network/api_logger_interceptor.dart' as _i831;
import 'package:ziro_fit/core/network/auth_interceptor.dart' as _i680;
import 'package:ziro_fit/core/network/cache_interceptor.dart' as _i921;
import 'package:ziro_fit/core/network/dio_client.dart' as _i488;
import 'package:ziro_fit/core/network/response_cache.dart' as _i340;
import 'package:ziro_fit/core/network/retry_interceptor.dart' as _i578;
import 'package:ziro_fit/core/security/active_mode_holder.dart' as _i939;
import 'package:ziro_fit/core/security/token_storage.dart' as _i601;
import 'package:ziro_fit/core/settings/appearance_settings_service.dart'
    as _i394;
import 'package:ziro_fit/core/settings/experimental_features_service.dart'
    as _i778;
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
import 'package:ziro_fit/features/custom_exercises/cubit/custom_exercises_cubit.dart'
    as _i1072;
import 'package:ziro_fit/features/custom_exercises/data/custom_exercises_api_service.dart'
    as _i677;
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
import 'package:ziro_fit/features/explore/data/explore_map_local_service.dart'
    as _i273;
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
import 'package:ziro_fit/features/notifications/data/api/push_api_service.dart'
    as _i1050;
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
import 'package:ziro_fit/features/profile/cubit/appearance_cubit.dart' as _i652;
import 'package:ziro_fit/features/profile/cubit/experimental_features_cubit.dart'
    as _i502;
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
import 'package:ziro_fit/features/trainer/cubit/payouts_cubit.dart' as _i482;
import 'package:ziro_fit/features/trainer/cubit/storefront_cubit.dart' as _i627;
import 'package:ziro_fit/features/trainer/cubit/subscription_cubit.dart' as _i0;
import 'package:ziro_fit/features/trainer/cubit/trainer_active_program_cubit.dart'
    as _i795;
import 'package:ziro_fit/features/trainer/cubit/trainer_add_client_cubit.dart'
    as _i106;
import 'package:ziro_fit/features/trainer/cubit/trainer_calendar_cubit.dart'
    as _i803;
import 'package:ziro_fit/features/trainer/cubit/trainer_check_in_detail_cubit.dart'
    as _i127;
import 'package:ziro_fit/features/trainer/cubit/trainer_check_in_review_cubit.dart'
    as _i33;
import 'package:ziro_fit/features/trainer/cubit/trainer_client_analytics_cubit.dart'
    as _i1014;
import 'package:ziro_fit/features/trainer/cubit/trainer_client_detail_cubit.dart'
    as _i634;
import 'package:ziro_fit/features/trainer/cubit/trainer_client_habits_cubit.dart'
    as _i163;
import 'package:ziro_fit/features/trainer/cubit/trainer_client_nutrition_cubit.dart'
    as _i1069;
import 'package:ziro_fit/features/trainer/cubit/trainer_client_packages_cubit.dart'
    as _i59;
import 'package:ziro_fit/features/trainer/cubit/trainer_client_sessions_cubit.dart'
    as _i348;
import 'package:ziro_fit/features/trainer/cubit/trainer_clients_cubit.dart'
    as _i563;
import 'package:ziro_fit/features/trainer/cubit/trainer_dashboard_cubit.dart'
    as _i838;
import 'package:ziro_fit/features/trainer/cubit/trainer_programs_cubit.dart'
    as _i753;
import 'package:ziro_fit/features/trainer/data/trainer_billing_api_service.dart'
    as _i472;
import 'package:ziro_fit/features/trainer/data/trainer_calendar_api_service.dart'
    as _i1031;
import 'package:ziro_fit/features/trainer/data/trainer_checkin_api_service.dart'
    as _i300;
import 'package:ziro_fit/features/trainer/data/trainer_clients_api_service.dart'
    as _i861;
import 'package:ziro_fit/features/trainer/data/trainer_dashboard_api_service.dart'
    as _i444;
import 'package:ziro_fit/features/trainer/data/trainer_events_api_service.dart'
    as _i1022;
import 'package:ziro_fit/features/trainer/data/trainer_nutrition_api_service.dart'
    as _i270;
import 'package:ziro_fit/features/trainer/data/trainer_payouts_api_service.dart'
    as _i276;
import 'package:ziro_fit/features/trainer/data/trainer_programs_api_service.dart'
    as _i742;
import 'package:ziro_fit/features/trainer/data/trainer_recipes_api_service.dart'
    as _i979;
import 'package:ziro_fit/features/trainer/data/trainer_resources_api_service.dart'
    as _i903;
import 'package:ziro_fit/features/trainer/data/trainer_settings_api_service.dart'
    as _i821;
import 'package:ziro_fit/features/trainer/data/trainer_storefront_api_service.dart'
    as _i885;
import 'package:ziro_fit/features/trainers/cubit/exercise_detail_cubit.dart'
    as _i109;
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
    final queryClientModule = _$QueryClientModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i895.Connectivity>(() => connectivityModule.connectivity);
    gh.singleton<_i365.AppDatabase>(() => _i365.AppDatabase());
    gh.singleton<_i448.QueryClient>(() => queryClientModule.queryClient);
    gh.singleton<_i467.LocationService>(() => _i467.LocationService());
    gh.singleton<_i831.ApiLoggerInterceptor>(
      () => _i831.ApiLoggerInterceptor(),
    );
    gh.singleton<_i921.CacheInterceptor>(() => _i921.CacheInterceptor());
    gh.singleton<_i340.ResponseCache>(() => _i340.ResponseCache());
    gh.singleton<_i578.RetryInterceptor>(() => _i578.RetryInterceptor());
    gh.singleton<_i939.ActiveModeHolder>(() => _i939.ActiveModeHolder());
    gh.singleton<_i601.TokenStorage>(() => _i601.TokenStorage());
    gh.singleton<_i394.AppearanceSettingsService>(
      () => _i394.AppearanceSettingsService(),
    );
    gh.singleton<_i778.ExperimentalFeaturesService>(
      () => _i778.ExperimentalFeaturesService(),
    );
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
    gh.factory<_i502.ExperimentalFeaturesCubit>(
      () => _i502.ExperimentalFeaturesCubit(
        gh<_i778.ExperimentalFeaturesService>(),
      ),
    );
    gh.factory<_i652.AppearanceCubit>(
      () => _i652.AppearanceCubit(gh<_i394.AppearanceSettingsService>()),
    );
    gh.singleton<_i296.AnalyticsLocalService>(
      () => _i296.AnalyticsLocalService(gh<_i365.AppDatabase>()),
    );
    gh.singleton<_i273.ExploreMapLocalService>(
      () => _i273.ExploreMapLocalService(gh<_i365.AppDatabase>()),
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
      () => _i680.AuthInterceptor(
        gh<_i601.TokenStorage>(),
        gh<_i939.ActiveModeHolder>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideDio(
        gh<_i831.ApiLoggerInterceptor>(),
        gh<_i921.CacheInterceptor>(),
        gh<_i680.AuthInterceptor>(),
        gh<_i578.RetryInterceptor>(),
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
    gh.factory<_i677.CustomExercisesApiService>(
      () => _i677.CustomExercisesApiService(gh<_i361.Dio>()),
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
    gh.factory<_i1050.PushApiService>(
      () => _i1050.PushApiService(gh<_i361.Dio>()),
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
    gh.factory<_i472.TrainerBillingApiService>(
      () => _i472.TrainerBillingApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i1031.TrainerCalendarApiService>(
      () => _i1031.TrainerCalendarApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i300.TrainerCheckInApiService>(
      () => _i300.TrainerCheckInApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i861.TrainerClientsApiService>(
      () => _i861.TrainerClientsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i444.TrainerDashboardApiService>(
      () => _i444.TrainerDashboardApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i1022.TrainerEventsApiService>(
      () => _i1022.TrainerEventsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i270.TrainerNutritionApiService>(
      () => _i270.TrainerNutritionApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i276.TrainerPayoutsApiService>(
      () => _i276.TrainerPayoutsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i742.TrainerProgramsApiService>(
      () => _i742.TrainerProgramsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i979.TrainerRecipesApiService>(
      () => _i979.TrainerRecipesApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i903.TrainerResourcesApiService>(
      () => _i903.TrainerResourcesApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i821.TrainerSettingsApiService>(
      () => _i821.TrainerSettingsApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i885.TrainerStorefrontApiService>(
      () => _i885.TrainerStorefrontApiService(gh<_i361.Dio>()),
    );
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
    gh.factory<_i795.TrainerActiveProgramCubit>(
      () =>
          _i795.TrainerActiveProgramCubit(gh<_i861.TrainerClientsApiService>()),
    );
    gh.factory<_i106.TrainerAddClientCubit>(
      () => _i106.TrainerAddClientCubit(gh<_i861.TrainerClientsApiService>()),
    );
    gh.factory<_i1014.TrainerClientAnalyticsCubit>(
      () => _i1014.TrainerClientAnalyticsCubit(
        gh<_i861.TrainerClientsApiService>(),
      ),
    );
    gh.factory<_i634.TrainerClientDetailCubit>(
      () =>
          _i634.TrainerClientDetailCubit(gh<_i861.TrainerClientsApiService>()),
    );
    gh.factory<_i163.TrainerClientHabitsCubit>(
      () =>
          _i163.TrainerClientHabitsCubit(gh<_i861.TrainerClientsApiService>()),
    );
    gh.factory<_i1069.TrainerClientNutritionCubit>(
      () => _i1069.TrainerClientNutritionCubit(
        gh<_i861.TrainerClientsApiService>(),
      ),
    );
    gh.factory<_i59.TrainerClientPackagesCubit>(
      () =>
          _i59.TrainerClientPackagesCubit(gh<_i861.TrainerClientsApiService>()),
    );
    gh.factory<_i348.TrainerClientSessionsCubit>(
      () => _i348.TrainerClientSessionsCubit(
        gh<_i861.TrainerClientsApiService>(),
      ),
    );
    gh.factory<_i563.TrainerClientsCubit>(
      () => _i563.TrainerClientsCubit(gh<_i861.TrainerClientsApiService>()),
    );
    gh.singleton<_i742.SharingRepository>(
      () => _i742.SharingRepository(
        gh<_i796.SharingApiService>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.factory<_i482.PayoutsCubit>(
      () => _i482.PayoutsCubit(gh<_i276.TrainerPayoutsApiService>()),
    );
    gh.factory<_i753.TrainerProgramsCubit>(
      () => _i753.TrainerProgramsCubit(gh<_i742.TrainerProgramsApiService>()),
    );
    gh.factory<_i64.ExploreCubit>(
      () => _i64.ExploreCubit(
        gh<_i549.ExploreApiService>(),
        gh<_i467.LocationService>(),
        gh<_i340.ResponseCache>(),
        gh<_i448.QueryClient>(),
      ),
    );
    gh.factory<_i28.SharingCubit>(
      () => _i28.SharingCubit(gh<_i742.SharingRepository>()),
    );
    gh.singleton<_i1035.FitnessGoalsRepository>(
      () => _i1035.FitnessGoalsRepository(
        gh<_i1029.FitnessGoalsApiService>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.singleton<_i514.MeasurementsRepository>(
      () => _i514.MeasurementsRepository(gh<_i181.MeasurementsApiService>()),
    );
    gh.singleton<_i979.CheckInRepository>(
      () => _i979.CheckInRepository(
        gh<_i207.CheckInApiService>(),
        gh<_i340.ResponseCache>(),
      ),
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
    gh.factory<_i803.TrainerCalendarCubit>(
      () => _i803.TrainerCalendarCubit(gh<_i1031.TrainerCalendarApiService>()),
    );
    gh.singleton<_i982.NutritionHabitsRepository>(
      () => _i982.NutritionHabitsRepository(
        gh<_i416.NutritionHabitsApiService>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.factory<_i838.TrainerDashboardCubit>(
      () => _i838.TrainerDashboardCubit(
        gh<_i444.TrainerDashboardApiService>(),
        gh<_i1031.TrainerCalendarApiService>(),
        gh<_i300.TrainerCheckInApiService>(),
      ),
    );
    gh.factory<_i803.EventDetailCubit>(
      () => _i803.EventDetailCubit(gh<_i549.ExploreApiService>()),
    );
    gh.factory<_i975.TrainerDiscoveryCubit>(
      () => _i975.TrainerDiscoveryCubit(gh<_i549.ExploreApiService>()),
    );
    gh.singleton<_i329.NotificationRepository>(
      () => _i329.NotificationRepository(
        gh<_i781.NotificationApiService>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.singleton<_i413.FitnessGoalsCubit>(
      () => _i413.FitnessGoalsCubit(gh<_i1035.FitnessGoalsRepository>()),
    );
    gh.factory<_i1072.CustomExercisesCubit>(
      () => _i1072.CustomExercisesCubit(gh<_i677.CustomExercisesApiService>()),
    );
    gh.factory<_i127.TrainerCheckInDetailCubit>(
      () =>
          _i127.TrainerCheckInDetailCubit(gh<_i300.TrainerCheckInApiService>()),
    );
    gh.factory<_i33.TrainerCheckInReviewCubit>(
      () =>
          _i33.TrainerCheckInReviewCubit(gh<_i300.TrainerCheckInApiService>()),
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
    gh.singleton<_i459.WorkoutSessionRepository>(
      () => _i459.WorkoutSessionRepository(
        gh<_i662.WorkoutSessionApiService>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.singleton<_i516.HomeRepository>(
      () => _i516.HomeRepository(
        gh<_i267.HomeApiService>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.factory<_i377.ExploreMapCubit>(
      () => _i377.ExploreMapCubit(
        gh<_i549.ExploreApiService>(),
        gh<_i467.LocationService>(),
        gh<_i273.ExploreMapLocalService>(),
      ),
    );
    gh.singleton<_i875.ProgramRepository>(
      () => _i875.ProgramRepository(gh<_i755.ProgramApiService>()),
    );
    gh.singleton<_i736.AuthRepository>(
      () => _i736.AuthRepository(
        gh<_i568.AuthApiService>(),
        gh<_i601.TokenStorage>(),
        gh<_i939.ActiveModeHolder>(),
      ),
    );
    gh.singleton<_i1063.TrainerRepository>(
      () => _i1063.TrainerRepository(
        gh<_i680.TrainerApiService>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.factory<_i0.SubscriptionCubit>(
      () => _i0.SubscriptionCubit(gh<_i472.TrainerBillingApiService>()),
    );
    gh.factory<_i627.StorefrontCubit>(
      () => _i627.StorefrontCubit(gh<_i885.TrainerStorefrontApiService>()),
    );
    gh.singleton<_i607.DailyTargetsRepository>(
      () => _i607.DailyTargetsRepository(
        gh<_i1058.DailyTargetsApiService>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.singleton<_i796.SyncCubit>(
      () => _i796.SyncCubit(
        gh<_i813.SyncRepository>(),
        gh<_i124.ConnectivityService>(),
      ),
    );
    gh.factory<_i465.CheckInCubit>(
      () => _i465.CheckInCubit(gh<_i979.CheckInRepository>()),
    );
    gh.factory<_i109.ExerciseDetailCubit>(
      () => _i109.ExerciseDetailCubit(gh<_i459.WorkoutSessionRepository>()),
    );
    gh.factory<_i871.WorkoutSessionCubit>(
      () => _i871.WorkoutSessionCubit(gh<_i459.WorkoutSessionRepository>()),
    );
    gh.factory<_i560.NutritionHabitsCubit>(
      () => _i560.NutritionHabitsCubit(gh<_i982.NutritionHabitsRepository>()),
    );
    gh.factory<_i137.TemplateDetailCubit>(
      () => _i137.TemplateDetailCubit(
        gh<_i459.WorkoutSessionRepository>(),
        gh<_i783.LocalTemplateRepository>(),
      ),
    );
    gh.factory<_i899.AnalyticsCubit>(
      () => _i899.AnalyticsCubit(
        gh<_i512.AnalyticsRepository>(),
        gh<_i296.AnalyticsLocalService>(),
        gh<_i124.ConnectivityService>(),
        gh<_i514.MeasurementsRepository>(),
      ),
    );
    gh.singleton<_i514.AuthCubit>(
      () => _i514.AuthCubit(
        gh<_i736.AuthRepository>(),
        gh<_i939.ActiveModeHolder>(),
        gh<_i340.ResponseCache>(),
        gh<_i365.AppDatabase>(),
        gh<_i448.QueryClient>(),
      ),
    );
    gh.factory<_i13.HomeCubit>(
      () => _i13.HomeCubit(
        gh<_i516.HomeRepository>(),
        gh<_i448.QueryClient>(),
        gh<_i514.AuthCubit>(),
      ),
    );
    gh.factory<_i195.WorkoutHistoryCubit>(
      () => _i195.WorkoutHistoryCubit(
        gh<_i459.WorkoutSessionRepository>(),
        gh<_i448.QueryClient>(),
      ),
    );
    gh.factory<_i727.ProgramCubit>(
      () => _i727.ProgramCubit(
        gh<_i875.ProgramRepository>(),
        gh<_i783.LocalTemplateRepository>(),
        gh<_i459.WorkoutSessionRepository>(),
      ),
    );
    gh.factory<_i501.DailyTargetsCubit>(
      () => _i501.DailyTargetsCubit(
        gh<_i607.DailyTargetsRepository>(),
        gh<_i514.AuthCubit>(),
      ),
    );
    gh.factory<_i19.MoreCubit>(
      () => _i19.MoreCubit(
        gh<_i768.ProfileApiService>(),
        gh<_i514.AuthCubit>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    gh.factory<_i851.ProfileConfigCubit>(
      () => _i851.ProfileConfigCubit(
        gh<_i768.ProfileApiService>(),
        gh<_i514.AuthCubit>(),
        gh<_i340.ResponseCache>(),
      ),
    );
    return this;
  }
}

class _$ConnectivityModule extends _i779.ConnectivityModule {}

class _$QueryClientModule extends _i397.QueryClientModule {}

class _$NetworkModule extends _i488.NetworkModule {}
