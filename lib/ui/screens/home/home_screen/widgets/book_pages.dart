import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/logic/blocs/file_picker/file_picker_bloc.dart';
import 'package:summarize_it/ui/screens/home/home_screen/widgets/book_image_widget.dart';

import '../../../../../core/utils/device_screen.dart';

class BookPages extends StatelessWidget {
  final List<Uint8List> files;
  const BookPages({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilePickerBloc, FilePickerStates>(
      builder: (context, state) {
        if (state is LoadedFilePickerState) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: DeviceScreen.w(context) / 2 - 10,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            padding: const EdgeInsets.only(bottom: kToolbarHeight + 60),
            itemCount: files.length,
            itemBuilder: (ctx, index) => GestureDetector(
              onTap: () {
                if (state.filePath != null) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          BookImageWidget(bookPath: state.filePath!),
                    ),
                  );
                }
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.memory(files[index]),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
