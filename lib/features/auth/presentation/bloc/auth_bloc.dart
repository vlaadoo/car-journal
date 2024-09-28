import 'package:car_journal/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:car_journal/core/common/entities/user.dart';
import 'package:car_journal/features/auth/domain/usecases/current_user.dart';
import 'package:car_journal/features/auth/domain/usecases/user_login.dart';
import 'package:car_journal/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devtools;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  bool _isInitialLoginCheck = true; // Флаг для проверки первичной авторизации

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthCheck>(_isUserLoggedIn);
  }

  bool isInitialLoginCheck() => _isInitialLoginCheck;

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignUp(
      UserSignUpParams(
        email: event.email,
        name: event.name,
        password: event.password,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  // Проверка авторизации при запуске приложения
  void _isUserLoggedIn(AuthCheck event, Emitter<AuthState> emit) async {
    devtools.log("Checking user");
    emit(AuthLoading()); // Отображаем загрузку на весь экран
    final res = await _currentUser(NoParams());

    _isInitialLoginCheck = false;
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
