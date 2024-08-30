import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summarize_it/data/repositories/all_repositories.dart';
import 'package:summarize_it/data/services/shared_prefs/user_prefs_service.dart';

import '../../../app_settings.dart';
import '../../../core/utils/utils.dart';
import '../user/user_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.initial()) {
    on<AuthEvent>(
      (
        AuthEvent events,
        Emitter<AuthState> emit,
      ) async {
        await events.map(
          login: (LoginUserEvent event) async =>
              await _onLoginUser(event, emit),
          register: (RegisterUserEvent event) async =>
              await _onRegisterUser(event, emit),
          resetPassword: (ResetPasswordEvent event) async =>
              await _onResetPassword(event, emit),
          watch: (WatchAuthEvent event) async =>
              await _onWatchAuth(event, emit),
          logout: (LogoutEvent event) async => await _onLogoutUser(event, emit),
        );
      },
    );
  }

  Future<void> _onLoginUser(
    LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      await _authRepository.login(email: event.email, password: event.password);
      await _getDATA();
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onRegisterUser(
    RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      await _authRepository.register(
        email: event.email,
        password: event.password,
      );

      await _userRepository.addUser(
        uid: FirebaseAuth.instance.currentUser?.uid ?? '',
        email: event.email,
        firstName: event.firstName,
        lastName: event.secondName,
      );

      await _getDATA();
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) =>
      _authRepository.resetPassword(email: event.email);

  Future<void> _onLogoutUser(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      await UserPrefsService.clearUser();

      UserData.toInitial();

      await _authRepository.logout();
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onWatchAuth(
    WatchAuthEvent event,
    Emitter<AuthState> emit,
  ) async =>
      await emit.forEach(
        _authRepository.watchAuth(),
        onData: (user) => user == null
            ? const AuthState.unauthenticated()
            : const AuthState.authenticated(),
      );

  Future<void> _getDATA() async {
    getIt.get<UserBloc>().add(const UserEvent.getUserEvent());
    await Apis.set();
  }
}
