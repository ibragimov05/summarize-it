import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_picker_events.dart';
part 'file_picker_states.dart';
part 'file_picker_bloc.freezed.dart';

class FilePickerBloc extends Bloc<FilePickerEvents, FilePickerStates> {
  FilePickerBloc() : super(const FilePickerStates.initial()) {
    on<SelectFileEvent>(_selectFile);
    on<ToInitialStateFilePickerEvent>(_toInitialStateFilePicker);
  }

  Future<void> _selectFile(
    SelectFileEvent event,
    Emitter<FilePickerStates> emit,
  ) async {
    try {
      emit(const FilePickerStates.loading());

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      final selectedFile =
          result != null ? File(result.files.single.path!) : null;

      emit(FilePickerStates.loaded(
        file: selectedFile,
        filePath: result?.paths.first,
      ));
    } catch (e) {
      emit(FilePickerStates.error(error: e.toString()));
    }
  }

  void _toInitialStateFilePicker(
    ToInitialStateFilePickerEvent event,
    Emitter<FilePickerStates> emit,
  ) =>
      emit(const FilePickerStates.initial());
}
