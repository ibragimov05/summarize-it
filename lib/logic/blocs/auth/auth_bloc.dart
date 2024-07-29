import 'package:bloc/bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:summarize_it/data/repositories/all_repositories.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(AuthState()) {
    on<InitialAuthEvent>(_onInitialize);
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_onRegisterUser);
    on<LogoutEvent>(_onLogoutUser);
    on<ToggleAuthEvent>(_onToggleAuth);
    on<WatchAuthEvent>(_onWatchAuth);
  }

  void _onInitialize(
    InitialAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      firstNameController: TextEditingController(),
      secondNameController: TextEditingController(),
      passwordController: TextEditingController(),
      passwordConfirmController: TextEditingController(),
      status: AuthStatus.initial,
    ));
  }

  void _loginUser(
    LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      if (state.formKey.currentState!.validate()) {
        emit(state.copyWith(status: AuthStatus.loading));
        await _authRepository.login(
          email: state.emailController!.text,
          password: state.passwordConfirmController!.text,
        );
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
    }
  }

  void _onRegisterUser(
    RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {} catch (e) {
      emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
    }
  }

  void _onLogoutUser(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _authRepository.logout();
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
    }
  }

  void _onToggleAuth(ToggleAuthEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      isLogin: !state.isLogin,
      status: AuthStatus.initial,
      emailController: state.emailController!..clear(),
      firstNameController: state.firstNameController!..clear(),
      secondNameController: state.secondNameController!..clear(),
      passwordController: state.passwordController!..clear(),
      passwordConfirmController: state.passwordConfirmController!..clear(),
    ));
  }

  void _onWatchAuth(
    WatchAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    await emit.forEach(
      _authRepository.watchAuth(),
      onData: (user) {
        return state.copyWith(
          user: user,
          status: user == null
              ? AuthStatus.unauthenticated
              : AuthStatus.authenticated,
        );
      },
    );
  }
}
