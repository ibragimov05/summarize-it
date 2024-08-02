part of 'file_picker_bloc.dart';

sealed class FilePickerStates {}

final class InitialFilePickerState extends FilePickerStates {}

final class LoadingFilePickerState extends FilePickerStates {}

final class LoadedFilePickerState extends FilePickerStates {
  final String? filePath;
  final File? file;

  LoadedFilePickerState({required this.filePath,required this.file});
}

final class ErrorFilePickerState extends FilePickerStates {
  final String error;
  ErrorFilePickerState({required this.error});
}
