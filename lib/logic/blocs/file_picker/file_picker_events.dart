part of 'file_picker_bloc.dart';

sealed class FilePickerEvents {}

final class SelectFileEvent extends FilePickerEvents {}

final class ToInitialStateFilePickerEvent extends FilePickerEvents {}
