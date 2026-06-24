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
import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart' as _i514;
import 'package:ziro_fit/features/auth/data/auth_api_service.dart' as _i568;
import 'package:ziro_fit/features/auth/data/auth_repository.dart' as _i736;
import 'package:ziro_fit/features/explore/cubit/explore_cubit.dart' as _i64;
import 'package:ziro_fit/features/explore/cubit/explore_map_cubit.dart'
    as _i377;
import 'package:ziro_fit/features/explore/cubit/trainer_discovery_cubit.dart'
    as _i975;
import 'package:ziro_fit/features/explore/data/explore_api_service.dart'
    as _i549;
import 'package:ziro_fit/features/explore/data/explore_repository.dart'
    as _i226;
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
import 'package:ziro_fit/features/sync/cubit/sync_cubit.dart' as _i796;
import 'package:ziro_fit/features/sync/data/sync_api_service.dart' as _i93;
import 'package:ziro_fit/features/sync/data/sync_repository.dart' as _i813;
import 'package:ziro_fit/features/trainers/cubit/trainer_list_cubit.dart'
    as _i329;
import 'package:ziro_fit/features/trainers/cubit/workout_history_cubit.dart'
    as _i195;
import 'package:ziro_fit/features/trainers/cubit/workout_session_cubit.dart'
    as _i871;
import 'package:ziro_fit/features/trainers/data/trainer_api_service.dart'
    as _i680;
import 'package:ziro_fit/features/trainers/data/trainer_repository.dart'
    as _i1063;
import 'package:ziro_fit/features/trainers/data/workout_session_api_service.dart'
    as _i662;
import 'package:ziro_fit/features/trainers/data/workout_session_repository.dart'
    as _i459;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final connectivityModule = _$ConnectivityModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i137.TemplateDetailCubit>(() => _i137.TemplateDetailCubit());
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
    gh.singleton<_i124.ConnectivityService>(
      () => _i124.ConnectivityService(connectivity: gh<_i895.Connectivity>()),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i783.LocalTemplateRepository>(
      () => _i783.LocalTemplateRepository(gh<_i365.AppDatabase>()),
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
    gh.factory<_i568.AuthApiService>(
      () => _i568.AuthApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i549.ExploreApiService>(
      () => _i549.ExploreApiService(gh<_i361.Dio>()),
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
    gh.factory<_i93.SyncApiService>(() => _i93.SyncApiService(gh<_i361.Dio>()));
    gh.factory<_i680.TrainerApiService>(
      () => _i680.TrainerApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i662.WorkoutSessionApiService>(
      () => _i662.WorkoutSessionApiService(gh<_i361.Dio>()),
    );
    gh.singleton<_i459.WorkoutSessionRepository>(
      () =>
          _i459.WorkoutSessionRepository(gh<_i662.WorkoutSessionApiService>()),
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
    gh.singleton<_i226.ExploreRepository>(
      () => _i226.ExploreRepository(gh<_i549.ExploreApiService>()),
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
    gh.singleton<_i1063.TrainerRepository>(
      () => _i1063.TrainerRepository(gh<_i680.TrainerApiService>()),
    );
    gh.factory<_i861.NotificationsCubit>(
      () => _i861.NotificationsCubit(
        gh<_i329.NotificationRepository>(),
        gh<_i115.NotificationRealtimeService>(),
      ),
    );
    gh.factory<_i514.AuthCubit>(
      () => _i514.AuthCubit(gh<_i736.AuthRepository>()),
    );
    gh.singleton<_i875.ProgramRepository>(
      () => _i875.ProgramRepository(gh<_i755.ProgramApiService>()),
    );
    gh.singleton<_i796.SyncCubit>(
      () => _i796.SyncCubit(
        gh<_i813.SyncRepository>(),
        gh<_i124.ConnectivityService>(),
      ),
    );
    gh.factory<_i64.ExploreCubit>(
      () => _i64.ExploreCubit(gh<_i226.ExploreRepository>()),
    );
    gh.factory<_i975.TrainerDiscoveryCubit>(
      () => _i975.TrainerDiscoveryCubit(gh<_i226.ExploreRepository>()),
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
    gh.factory<_i727.ProgramCubit>(
      () => _i727.ProgramCubit(
        gh<_i875.ProgramRepository>(),
        gh<_i783.LocalTemplateRepository>(),
      ),
    );
    gh.factory<_i13.HomeCubit>(
      () => _i13.HomeCubit(gh<_i516.HomeRepository>()),
    );
    return this;
  }
}

class _$ConnectivityModule extends _i779.ConnectivityModule {}

class _$NetworkModule extends _i488.NetworkModule {}
