import 'package:bloc/bloc.dart';

class PdfPageCubit extends Cubit<Map<String, int>> {
  PdfPageCubit() : super({"currentPage": 0, "totalPages": 0});

  void updatePage(int currentPage, int totalPages) {
    emit({"currentPage": currentPage, "totalPages": totalPages});
  }
}