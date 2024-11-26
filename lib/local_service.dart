import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rebuild/feature/data/repositories/orders_repository_impl.dart';
import 'package:rebuild/feature/data/repositories/responses_repository_impl.dart';
import 'package:rebuild/feature/data/repositories/user_repository_impl.dart';
import 'package:rebuild/feature/domain/repositories/orders_repository.dart';
import 'package:rebuild/feature/domain/repositories/responses_repository.dart';
import 'package:rebuild/feature/domain/repositories/user_repository.dart';
import 'package:rebuild/feature/domain/usecases/auth/sign_in_user.dart';
import 'package:rebuild/feature/domain/usecases/auth/sign_up_user.dart';
import 'package:rebuild/feature/domain/usecases/orders/create_order.dart';
import 'package:rebuild/feature/domain/usecases/orders/delete_order.dart';
import 'package:rebuild/feature/domain/usecases/orders/get_all_orders.dart';
import 'package:rebuild/feature/domain/usecases/orders/update_order.dart';
import 'package:rebuild/feature/domain/usecases/responses/create_order.dart';
import 'package:rebuild/feature/domain/usecases/responses/delete_order.dart';
import 'package:rebuild/feature/domain/usecases/responses/get_orders.dart';
import 'package:rebuild/feature/domain/usecases/responses/update_order.dart';
import 'package:rebuild/feature/presentations/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:rebuild/feature/presentations/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory<SignInUserCubit>(() => SignInUserCubit(signInUser: sl()));
  sl.registerFactory<SignUpUserCubit>(() => SignUpUserCubit(signUpUser: sl()));

  // UseCases
  sl.registerLazySingleton<SignInUser>(() => SignInUser(userRepository: sl()));
  sl.registerLazySingleton<SignUpUser>(() => SignUpUser(userRepository: sl()));
  
  sl.registerLazySingleton<CreateOrder>(() => CreateOrder(sl()));
  sl.registerLazySingleton<DeleteOrder>(() => DeleteOrder(sl()));
  sl.registerLazySingleton<UpdateOrder>(() => UpdateOrder(sl()));
  sl.registerLazySingleton<GetOrders>(() => GetOrders(sl()));

  sl.registerLazySingleton<CreateResponse>(() => CreateResponse(sl()));
  sl.registerLazySingleton<DeleteResponse>(() => DeleteResponse(sl()));
  sl.registerLazySingleton<UpdateResponse>(() => UpdateResponse(sl()));
  sl.registerLazySingleton<GetResponses>(() => GetResponses(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSources: sl()));
  sl.registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(sl()));
  sl.registerLazySingleton<ResponsesRepository>(
      () => ResponsesRepositoryImpl(sl()));

  // External
  sl.registerLazySingleton<Supabase>(() => Supabase.instance);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}