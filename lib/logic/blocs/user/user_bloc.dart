import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/models.dart';
import '../../../core/utils/user_data.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/services/shared_prefs/user_prefs_service.dart';

part 'user_event.dart';
part 'user_bloc.freezed.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const UserState()) {
    on<GetUserEvent>(_onGetUser);
    on<AddNewUserEvent>(_onAddNewUser);
    on<UpdateUserDataEvent>(_onUpdateUserData);
  }

  void _onGetUser(
    GetUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) return;

    emit(state.copyWith(userStatus: UserStatus.loading));

    try {
      final appResponse = await _userRepository.getUser(uid: uid);

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        final user = (appResponse.data as UserModel);

        UserPrefsService.updateUser(user);
        UserData.set(user);

        emit(state.copyWith(
          userStatus: UserStatus.loaded,
          user: user,
        ));
      } else {
        throw 'error: {status_code: ${appResponse.errorStatusCode}, message: ${appResponse.errorMessage}';
      }
    } catch (e) {
      emit(state.copyWith(
        userStatus: UserStatus.error,
        error: e.toString(),
      ));
    }
  }

  void _onAddNewUser(
    AddNewUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(userStatus: UserStatus.loading));

    try {
      await _userRepository.addUser(
        uid: event.uid,
        email: event.email,
        firstName: event.firstName,
        lastName: event.lastName,
      );
    } catch (e) {
      emit(state.copyWith(
        userStatus: UserStatus.error,
        error: e.toString(),
      ));
    }
  }

  void _onUpdateUserData(
    UpdateUserDataEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(userStatus: UserStatus.loading));

    try {
      final appResponse = await _userRepository.editUserInfo(
        userId: UserData.id,
        firstName: event.firstName,
        secondName: event.secondName,
      );

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        add(const UserEvent.getUserEvent());
      } else {
        throw 'error: {status_code: ${appResponse.errorStatusCode}, message: ${appResponse.errorMessage}';
      }
    } catch (e) {
      emit(state.copyWith(
        userStatus: UserStatus.error,
        error: e.toString(),
      ));
    }
  }
}
