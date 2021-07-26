// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../utils/store_interactor.dart' as _i3;
import 'api_client.dart' as _i6;
import 'config.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final interactorRegisterModule = _$InteractorRegisterModule();
  final dioReggistorModule = _$DioReggistorModule();
  await gh.factoryAsync<_i3.StoreInteractor>(
      () => interactorRegisterModule.interactor,
      preResolve: true);
  gh.singleton<_i4.AppConfig>(_i4.AppConfig());
  gh.singleton<_i5.Dio>(dioReggistorModule.registerClient(
      get<_i3.StoreInteractor>(), get<_i4.AppConfig>()));
  return get;
}

class _$InteractorRegisterModule extends _i3.InteractorRegisterModule {}

class _$DioReggistorModule extends _i6.DioReggistorModule {}
