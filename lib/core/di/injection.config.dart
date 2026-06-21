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
import 'package:ziro_fit/core/network/api_logger_interceptor.dart' as _i831;
import 'package:ziro_fit/core/network/auth_interceptor.dart' as _i680;
import 'package:ziro_fit/core/network/dio_client.dart' as _i488;
import 'package:ziro_fit/core/security/token_storage.dart' as _i601;
import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart' as _i514;
import 'package:ziro_fit/features/auth/data/auth_api_service.dart' as _i568;
import 'package:ziro_fit/features/auth/data/auth_repository.dart' as _i736;
import 'package:ziro_fit/features/sync/cubit/sync_cubit.dart' as _i796;
import 'package:ziro_fit/features/sync/data/sync_api_service.dart' as _i93;
import 'package:ziro_fit/features/sync/data/sync_repository.dart' as _i813;
import 'package:ziro_fit/features/trainers/cubit/trainer_list_cubit.dart'
    as _i329;
import 'package:ziro_fit/features/trainers/data/trainer_api_service.dart'
    as _i680;
import 'package:ziro_fit/features/trainers/data/trainer_repository.dart'
    as _i1063;

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
    gh.singleton<_i831.ApiLoggerInterceptor>(
      () => _i831.ApiLoggerInterceptor(),
    );
    gh.singleton<_i601.TokenStorage>(() => _i601.TokenStorage());
    gh.singleton<_i124.ConnectivityService>(
      () => _i124.ConnectivityService(connectivity: gh<_i895.Connectivity>()),
      dispose: (i) => i.dispose(),
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
    gh.factory<_i93.SyncApiService>(() => _i93.SyncApiService(gh<_i361.Dio>()));
    gh.factory<_i680.TrainerApiService>(
      () => _i680.TrainerApiService(gh<_i361.Dio>()),
    );
    gh.singleton<_i813.SyncRepository>(
      () => _i813.SyncRepository(
        gh<_i93.SyncApiService>(),
        gh<_i365.AppDatabase>(),
      ),
    );
    gh.singleton<_i736.AuthRepository>(
      () => _i736.AuthRepository(
        gh<_i568.AuthApiService>(),
        gh<_i601.TokenStorage>(),
      ),
    );
    gh.singleton<_i1063.TrainerRepository>(
      () => _i1063.TrainerRepository(gh<_i680.TrainerApiService>()),
    );
    gh.factory<_i514.AuthCubit>(
      () => _i514.AuthCubit(gh<_i736.AuthRepository>()),
    );
    gh.singleton<_i796.SyncCubit>(
      () => _i796.SyncCubit(
        gh<_i813.SyncRepository>(),
        gh<_i124.ConnectivityService>(),
      ),
    );
    gh.factory<_i329.TrainerListCubit>(
      () => _i329.TrainerListCubit(gh<_i1063.TrainerRepository>()),
    );
    return this;
  }
}

class _$ConnectivityModule extends _i779.ConnectivityModule {}

class _$NetworkModule extends _i488.NetworkModule {}
