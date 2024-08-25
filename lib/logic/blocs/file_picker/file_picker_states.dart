part of 'file_picker_bloc.dart';

@freezed
class FilePickerStates with _$FilePickerStates {
  const factory FilePickerStates.initial() = InitialFilePickerState;

  const factory FilePickerStates.loading() = LoadingFilePickerState;

  const factory FilePickerStates.loaded({
    required String? filePath,
    required File? file,
  }) = LoadedFilePickerState;

  const factory FilePickerStates.error({required String error}) =
      ErrorFilePickerState;
}
