import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../utils/device_screen.dart';

class BookPages extends StatelessWidget {
  final List<Uint8List> files;
  const BookPages({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: DeviceScreen.w(context) / 2 - 10,
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
