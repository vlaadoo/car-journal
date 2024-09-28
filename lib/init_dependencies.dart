import 'package:car_journal/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:car_journal/core/secrets/app_secrets.dart';
import 'package:car_journal/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:car_journal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:car_journal/features/auth/domain/repository/auth_repository.dart';
import 'package:car_journal/features/auth/domain/usecases/current_user.dart';
import 'package:car_journal/features/auth/domain/usecases/user_login.dart';
import 'package:car_journal/features/auth/domain/usecases/user_sign_up.dart';
import 'package:car_journal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);

  // core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    // Usecases
    ..registerFactory(
      () => UserSignUp(serviceLocator()),
    )
    ..registerFactory(
      () => UserLogin(serviceLocator()),
    )
    ..registerFactory(
      () => CurrentUser(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
