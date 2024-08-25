part of 'file_picker_bloc.dart';

@freezed
class FilePickerEvents with _$FilePickerEvents {
  const factory FilePickerEvents.selectFile() = SelectFileEvent;
  const factory FilePickerEvents.toInitialStateFilePicker() = ToInitialStateFilePickerEvent;
}
