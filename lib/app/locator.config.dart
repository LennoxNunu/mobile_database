// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/database/moor_database.dart';
import '../services/third_party_service_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServiceModule = _$ThirdPartyServiceModule();
  gh.lazySingleton<DialogService>(() => thirdPartyServiceModule.dailogService);
  gh.lazySingleton<MyDatabase>(() => MyDatabase());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServiceModule.navigationService);
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServiceModule.snackBarService);
  return get;
}

class _$ThirdPartyServiceModule extends ThirdPartyServiceModule {
  @override
  DialogService get dailogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
