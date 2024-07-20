import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';

part 'file_picker_events.dart';

part 'file_picker_states.dart';

class FilePickerBloc extends Bloc<FilePickerEvents, FilePickerStates> {
  FilePickerBloc() : super(InitialFilePickerState()) {
    on<SelectFileEvent>(_selectFile);
  }

  void _selectFile(SelectFileEvent event, emit) async {
    try {
      emit(LoadingFilePickerState());

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      final selectedFile =
          result != null ? File(result.files.single.path!) : null;

      emit(LoadedFilePickerState(file: selectedFile));
    } catch (e) {
      emit(ErrorFilePickerState(error: e.toString()));
    }
  }
}
