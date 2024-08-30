import 'package:bloc/bloc.dart';

part 'tab_box_state.dart';

class TabBoxCubit extends Cubit<TabBoxState> {
  TabBoxCubit()
      : super(
          const TabBoxState(tabBoxCurrentIndex: 0, popCount: 0, canPop: false),
        );

  void changeTabBoxIndex({required int newIndex}) => emit(
        state.copyWith(
          tabBoxCurrentIndex: newIndex,
          popCount: newIndex != 0 ? 0 : state.popCount,
          canPop: newIndex != 0 ? false : state.canPop,
        ),
      );

  void increasePopCount() => emit(
        state.copyWith(
          popCount: state.popCount + 1,
          canPop: state.popCount + 1 == 1 ? true : state.canPop,
        ),
      );
}
