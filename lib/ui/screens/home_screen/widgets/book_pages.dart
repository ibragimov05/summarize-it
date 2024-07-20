import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/utils/responsive.dart';

import '../../../../logic/blocs/file_picker/file_picker_bloc.dart';
import '../../../../logic/blocs/pdf_to_image/pdf_to_image_bloc.dart';

class BookPages extends StatelessWidget {
  final List<Uint8List> files;
  const BookPages({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: Responsive.screenW(context) / 2 - 10,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: files.length,
      itemBuilder: (ctx, index) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.memory(files[index]),
        );
      },
    );
  }
}
