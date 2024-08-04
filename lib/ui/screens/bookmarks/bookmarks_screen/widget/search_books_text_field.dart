import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summarize_it/core/utils/app_assets.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';

import '../../../../../data/models/book.dart';

class SearchBooksTextField extends StatefulWidget {
  final List<Book> books;

  const SearchBooksTextField({super.key, required this.books});

  @override
  State<SearchBooksTextField> createState() => _SearchBooksTextFieldState();
}

class _SearchBooksTextFieldState extends State<SearchBooksTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bookBloc = context.read<BooksBloc>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _textEditingController,
        onChanged: (String value) {
          if (value.trim().isEmpty) {
            bookBloc
                .add(GetBookEvent(uid: FirebaseAuth.instance.currentUser!.uid));
          } else {
            context.read<BooksBloc>().add(
                  SearchBookEvent(bookName: value, books: widget.books),
                );
          }
        },
        style: AppTextStyles.workSansMain,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(AppAssets.icoSearchUn),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.green900,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.green900,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.green900,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
