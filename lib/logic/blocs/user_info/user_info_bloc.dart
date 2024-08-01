import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:summarize_it/core/utils/hive_box_constants.dart';
import 'package:summarize_it/data/models/user_model.dart';
import 'package:summarize_it/data/repositories/user_repository.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvents, UserInfoState> {
  final UserRepository _userRepository;
  UserInfoBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInfoState()) {
    on<GetUserInfoEvent>(_onGetUserInfo);
    on<AddUserInfoEvent>(_onAddUserInfo);
  }

  final Box _box = HiveConstants.box;

  void _onGetUserInfo(
    GetUserInfoEvent event,
    Emitter<UserInfoState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    try {
      final UserModel user = _box.get(HiveConstants.userInfo) as UserModel;
      emit(state.copyWith(
        id: user.id,
        uid: user.uid,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
      ));
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      debugPrint("UserInfoBloc _onGetUserInfo: ${e.toString()}");
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onAddUserInfo(
    AddUserInfoEvent event,
    Emitter<UserInfoState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final UserModel user = await _userRepository.getUser(
        email: event.email,
        uid: event.uid,
      );
      _box.put(HiveConstants.userInfo, user);
      emit(state.copyWith(
        id: user.id,
        uid: user.uid,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
