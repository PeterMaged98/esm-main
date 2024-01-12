import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/network_info.dart';
import '../network/network_manager.dart';
import 'navigation_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<NavHelper>(NavHelper());

  // data sources
  // getIt.registerLazySingleton<GuestAuthRemoteDataSource>(() => GuestAuthRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<NotificationRemoteDataSource>(() => NotificationRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<GuestEventsRemoteDataSource>(() => GuestEventsRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<GuestHomeRemoteDataSource>(() => GuestHomeRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<CacheDataSource>(() => CacheDataSource());

  //* Repository
  // getIt.registerLazySingleton<AuthRepo>(
  //   () => AuthRepoImpl(authRemoteDataSource: getIt(), networkInfo: getIt()),);
  // getIt.registerLazySingleton<NotificationRepo>(
  //       () => NotificationRepoImpl(notificationRemoteDataSource: getIt(), networkInfo: getIt()),);
  // getIt.registerLazySingleton<ProfileRepo>(
  //       () => ProfileRepoImpl(profileRemoteDataSource: getIt(), networkInfo: getIt()),);
  // getIt.registerLazySingleton<GuestEventsRepo>(
  //       () => GuestEventsRepoImpl(guestEventsRemoteDataSource: getIt(), networkInfo: getIt()),);
  // getIt.registerLazySingleton<GuestHomeRepo>(
  //       () => GuestHomeRepoImpl(guestHomeRemoteDataSource: getIt(), networkInfo: getIt()),);

  //* Use cases
  _authUseCases();
  _notificationsUseCases();
  _profileUseCases();
  _guestHomeUseCases();


  //! ----------- app -----------
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
}

void _authUseCases() {

  // getIt.registerLazySingleton<SignInUseCase>(
  //         () => SignInUseCase(repository: getIt()));
  //
  // getIt.registerLazySingleton<SignOutUseCase>(
  //         () => SignOutUseCase(repository: getIt()));
  //
  // getIt.registerLazySingleton<ForgetPasswordUseCase>(
  //         () => ForgetPasswordUseCase(repository: getIt()));
  //
  // getIt.registerLazySingleton<ResetPasswordUseCase>(
  //         () => ResetPasswordUseCase(repository: getIt()));

}

void _notificationsUseCases() {

  // getIt.registerLazySingleton<GuestGetNotificationCountUseCase>(
  //         () => GuestGetNotificationCountUseCase(repository: getIt()));
  //
  // getIt.registerLazySingleton<GuestGetNotificationsUseCase>(
  //         () => GuestGetNotificationsUseCase(repository: getIt()));

}

void _profileUseCases() {
  // getIt.registerLazySingleton<GetProfileUseCase>(
  //         () => GetProfileUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GuestUpdateProfileUseCase>(
  //         () => GuestUpdateProfileUseCase(repository: getIt()));
}


void _guestHomeUseCases() {
  // getIt.registerLazySingleton<GuestHomeUseCase>(
  //         () => GuestHomeUseCase(repository: getIt()));
}
