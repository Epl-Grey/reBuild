import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  // sl.registerFactory<SignInUserCubit>(() => SignInUserCubit(signInUser: sl()));

  // UseCases
  // sl.registerLazySingleton<SignInUser>(() => SignInUser(userRepository: sl()));

  // Repository
  // sl.registerLazySingleton<UserRepository>(
  //     () => UserRepositoryImpl(userRemoteDataSources: sl()));

  // External
  sl.registerLazySingleton<Supabase>(() => Supabase.instance);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}