import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/hive_box_constants.dart';
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
        super(InitialAuthState()) {
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_onRegisterUser);
    on<ResetPasswordEvent>(_onResetPassword);
    on<LogoutEvent>(_onLogoutUser);
    on<WatchAuthEvent>(_onWatchAuth);
  }

  void _loginUser(LoginUserEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      await _authRepository.login(email: event.email, password: event.password);
    } catch (e) {
      emit(ErrorAuthState(errorMessage: e.toString()));
    }
  }

  void _onRegisterUser(RegisterUserEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      await _authRepository.register(
        email: event.email,
        password: event.password,
      );

      await _userRepository.addUser(
        firstName: event.firstName,
        lastName: event.secondName,
        email: event.email,
        uid: _authRepository.currentUser!.uid,
      );
    } catch (e) {
      emit(ErrorAuthState(errorMessage: e.toString()));
    }
  }

  void _onResetPassword(ResetPasswordEvent event, Emitter<AuthState> emit) =>
      _authRepository.resetPassword(
        email: FirebaseAuth.instance.currentUser?.email ?? 'null',
      );

  void _onLogoutUser(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      HiveConstants.box.delete(HiveConstants.userInfo);
      await _authRepository.logout();
    } catch (e) {
      emit(ErrorAuthState(errorMessage: e.toString()));
    }
  }

  void _onWatchAuth(
    WatchAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    await emit.forEach(
      _authRepository.watchAuth(),
      onData: (user) {
        return user == null ? UnauthenticatedState() : AuthenticatedState();
      },
    );
  }
}
