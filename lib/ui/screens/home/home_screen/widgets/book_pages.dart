import 'dart:typed_data';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/logic/blocs/file_picker/file_picker_bloc.dart';
import 'package:summarize_it/ui/screens/home/pdf_view_screen/pdf_view_screen.dart';

import '../../../../../core/utils/device_screen.dart';

class BookPages extends StatefulWidget {
  final List<Uint8List> files;
  const BookPages({super.key, required this.files});

  @override
  State<BookPages> createState() => _BookPagesState();
}

class _BookPagesState extends State<BookPages> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilePickerBloc, FilePickerStates>(
      builder: (BuildContext context, FilePickerStates state) {
        if (state is LoadedFilePickerState) {
          return FadingEdgeScrollView.fromScrollView(
            gradientFractionOnStart: 0.3,
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: DeviceScreen.w(context) / 2 - 10,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              padding: const EdgeInsets.only(
                bottom: kToolbarHeight * 2.5,
                top: kToolbarHeight,
              ),
              itemCount: widget.files.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  if (state.filePath != null) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PdfViewScreen(
                          pressedPageIndex: index,
                          bookPath: state.filePath!,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.memory(widget.files[index]),
                ),
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
