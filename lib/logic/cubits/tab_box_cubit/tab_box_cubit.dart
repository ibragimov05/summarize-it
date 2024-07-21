import 'package:bloc/bloc.dart';

class TabBoxCubit extends Cubit<int> {
  TabBoxCubit() : super(0);

  void changeTabBoxIndex(int newIndex) => emit(newIndex);
}
